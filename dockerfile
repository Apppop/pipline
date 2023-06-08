# เริ่มต้นด้วยภาพพื้นฐาน
FROM golang:1.17-alpine

# ตั้งค่าไดเร็กทอรี่ทำงานภายในคอนเทนเนอร์
WORKDIR /app

# คัดลอกไฟล์ Go mod และ sum
COPY ./go.mod ./

# # ดาวน์โหลดและติดตั้ง Go dependencies
RUN go mod download

# # คัดลอกส่วนที่เหลือของโค้ดแอปพลิเคชัน
COPY . .

# # สร้างแอปพลิเคชัน Go
RUN go build -o app

# # ตั้งค่าคำสั่งเริ่มต้นให้รันไฟล์ executable
CMD ["./app"]
