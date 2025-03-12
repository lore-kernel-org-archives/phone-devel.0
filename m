Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC1423F360
	for <phone-devel@vger.kernel.org>; Wed, 12 Mar 2025 11:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741778109; cv=none; b=Dj2SnjsbJINl6dbk0ivApO8iGzQd22tu61WwCrfF5IHkhBEqhn0O8P+gObUL0lA1EWW+zRz/LRauycBGEEF+qP28JrvYZV5rsICK5whZBrqec1+AILlht7+us2qFWKixuFh2gwfAWRoL1qQx2jvOngCR01qAEN3u4UAzltWFYgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741778109; c=relaxed/simple;
	bh=hzIkYqCNiMo80kaSTJ9vM3Dwk3kxjnW9SITUVTmj8p8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bEfbbOESG6R85382eSNRPRNApr7qzif0ZimALXniNwsRnIhzxBzaqu1W21neQjP2Q5c1oopEIe55MaxYbf+sxSVBMjTbZ3vYLOSXEtgTEb31HVWGAbpgtGyX16TSA+ygEqMF7Np19p7veWQGBKmfrME8yBA8HNoxmyLi07nQmXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=gab5QYhm; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="gab5QYhm"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac2a089fbbdso159391166b.1
        for <phone-devel@vger.kernel.org>; Wed, 12 Mar 2025 04:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1741778105; x=1742382905; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lrye5RapocrcbRYwFATS9q/NOK1mFM++X2eM3TdS8l4=;
        b=gab5QYhmj5E6mXJWr6tomW+oQwDECS3Hvb2RRVP6BuILFrh86W76eM4HuYEmwr/VSk
         M78v3ap6W0ZroEbU2K7mFOYg10oYoSKkc9Jl9ASYa0+9NzGDF6x9F9/Dex/PwyOV/PAD
         BJSnyr+ppkgO466FaFyW481xoeJvE340w69yCNznNbNcsSHq9rSeh3MJxYZ7I2+r5Cl7
         Ixs+miYaXBP03jChomiYu74RBLPy5T/qda34b73OrLQRcYNnV4ikdQeiB6+r4ldZrIKO
         d6iLld4i1L2kQTW3Eh9dXffh4Qe4EZh9JpQxWfQC7cJiGFoC3FF3KM+/mcWfo0ITqqi1
         QK3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741778105; x=1742382905;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lrye5RapocrcbRYwFATS9q/NOK1mFM++X2eM3TdS8l4=;
        b=j9aCqfIyYKCVQJbwXcMR1zx0ZYLrhDgQ5qVf0nv/DR/olG9sI++v+ZSQiS6oCvjkNA
         AqsgbEm8xLyb3EuYHCpbAZsIZPcw9c+pjhYE4by/HEHrmAUyhcml9yxCqxPROK4hA2Ae
         i0Gj/zXKxrMWkeoHnSQVQvtMybNMT4ldrvlGzdj8AerKxRB/ZyfFpRXk9oQTvG5KkM9Z
         s5hZH5VJtTDeoYX5raIi9iTnAUAD9jL92s+fSgUvRqpAzFnwcP8sjfBwfurGHRvxGQj9
         tMbUbm6bxNje2QyIk9MGihY0M+bDrbMcHJzJOMiRJh1mjLk/ev2CCjvUS3K9WM0muYkv
         yx5Q==
X-Forwarded-Encrypted: i=1; AJvYcCU7eqs1GDVBTYhRFnLH/UuqODFWGuTSmXH5BT32Cy+ajCAaxCtcR0dVHxyzcHDNCUOTfcRSoGlYTduTcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzA5jLL2Y9SEzoEJiUHlJhr5YBX2Pj37yHJ8jaAcryaj+OVUMOt
	vpV3xF2ZOG6k2YG/ltRt733reZvOUmC/LqHTFSaowvdUDNxs6FcaEGWLzg1VXTU=
X-Gm-Gg: ASbGncvNknK/RdpHQMZ6NixLLVGNAcxYr/lXtOdA/eN+Jj5Sh/ibv1yd+Swyf0btw6y
	uDXFZDSl9VMEvgHQiIGzCE2BIJQs1ULwAokPyXaQkJ4Xl4c1JHdcCtU5uMhrw89CtG4YFNR2QsL
	uAJncg1WN0cByfDcChbUFDKokklSAW1eoQUzocl2qaLCXT7wV3aVrE7OdDOVozdPazMnZxdNcFM
	KCLgjQ2aRAtwzWCKtMmwr5M51TyAhyxyXqVZKycmPjYxBWN53oIG+4tdW2i4MMl9Ieyq7TINSAW
	BvhM/tv9t5LNS6megSMkBtUj8JBUOPinRveiwGMzxWgJuMyNfzkarfPAzMN5HqZXsTX4bxg204p
	92YMZPAPIPi7wgYf8bw==
X-Google-Smtp-Source: AGHT+IHnclcokenSW0BD2xU3JDOUI3YTaP87OCmSR72jOip2Alz/yxNoSA2D0hIW7QuWvkEWzMqRrQ==
X-Received: by 2002:a17:907:82a0:b0:ac2:3a1:5a81 with SMTP id a640c23a62f3a-ac2ba53c9a5mr744096066b.26.1741778104396;
        Wed, 12 Mar 2025 04:15:04 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2a89f381fsm414129666b.169.2025.03.12.04.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 04:15:04 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 12 Mar 2025 12:14:59 +0100
Subject: [PATCH v2] arm64: dts: qcom: qcm6490-fairphone-fp5: Add
 touchscreen node
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-fp5-touchscreen-v2-1-4bed270e0065@fairphone.com>
X-B4-Tracking: v=1; b=H4sIALJs0WcC/2WNOw7CMBAFrxJtjZE/SQRUuQdKYdZrvAV2ZIcIF
 OXumFBSzkhv3gqFMlOBS7NCpoULp1hBHxrAYOOdBLvKoKXupJZG+KkTc3piKJiJokDsz71UpnX
 2BnU1ZfL82ovXsXLgMqf83g8W9bW/llHqr7UooUTrTtI6Q63zOHjLeQop0hHTA8Zt2z6Cr18gs
 gAAAA==
X-Change-ID: 20250203-fp5-touchscreen-cc6960134dab
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jens Reidel <adrian@mainlining.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Add a node for the GT9897 touchscreen found on this smartphone connected
via SPI.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Use interrupts-extended for irq (Konrad)
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20250311-fp5-touchscreen-v1-1-4d80ad3e4dfc@fairphone.com
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 356cee8aeba90e21c11f46df924ed180bfce3160..0f1c83822f66f95b05d851a5d28b418ff048b09d 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -1069,7 +1069,17 @@ &sdhc_2 {
 &spi13 {
 	status = "okay";
 
-	/* Goodix touchscreen @ 0 */
+	touchscreen@0 {
+		compatible = "goodix,gt9897";
+		reg = <0>;
+		interrupts-extended = <&tlmm 81 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&tlmm 105 GPIO_ACTIVE_LOW>;
+		avdd-supply = <&vreg_l3c>;
+		vddio-supply = <&vreg_l2c>;
+		spi-max-frequency = <1000000>;
+		touchscreen-size-x = <1224>;
+		touchscreen-size-y = <2700>;
+	};
 };
 
 &tlmm {

---
base-commit: 3910363993da7c2a1d31dc247de59e8ca1cf25fa
change-id: 20250203-fp5-touchscreen-cc6960134dab

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

