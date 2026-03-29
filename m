Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11BA2857CC
	for <phone-devel@vger.kernel.org>; Sun, 29 Mar 2026 04:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774759739; cv=none; b=nWzpLqXEajY2mndBvFJ87gIG0j9cKT+SVTEK2v62gQmj2cs0tkjJgCzydkYPjmCQZPOW0g3q/IG0dcQV9jzte3jOtGFcsP72Ge6vKD2erwUjWBHqeKZVtJvBp7NXdDma5qq72gBNWARd7+B73pGwS4aDPWk05YT0P4ibwcB4G0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774759739; c=relaxed/simple;
	bh=pGKPix7XiEt441lKBW8Y9b0Y9EmW4lxtf6JcRfDKsWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=itoU3rxTz1WBje4H7wzeZ/eLfwvfiBY/8LW96iQ8SGzHx1fv7b3cE6emvGN8v+EKQalixKJR9+1BwVePwZp6fYeBxuYoFI19GycRXlZsNR+NJ0QqyN2sBQNmmUPb75h5i9H/p9d4RxwvbVtqJvvUJbWopym3vW6ARB227sQvB4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pETnFdge; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pETnFdge"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-35c2fe0d90fso1155975a91.1
        for <phone-devel@vger.kernel.org>; Sat, 28 Mar 2026 21:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774759737; x=1775364537; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sH1ZtNzw7ASBY+TGObLJ+aQIZVnb+gkilqaMw0lmvhQ=;
        b=pETnFdgeZDjhWJx7qdfn+Q3+x4F2R0sIk8fjtKm5gRbkSs9Z24WqpPBn9ub0yFhl0I
         DC6bIs8bmZWtmKmaB1F+lyqfJUApA5rZ4h5YiaWKtLcVeDdFm+bPxbM1W4nrAJo2+5EU
         w+ahwNwgmNWJ27WfRY+/o5xwrezmb69/virhHfjMG3mtbjGoSh3rJtqBxWTzsCKvbsng
         BLiHbk7V/odSxcUpiIyomaegBVI0X0pJSfoMOzPLTTczme0wagdbWCgznrIU4HEa+Lkq
         DPKWlzxNb5mF6f9Bx72TjgvWuU6lZ99CVqzYFgwqYipVqe+JlHp0Q3gEhgCCAFXhNmUK
         hh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774759737; x=1775364537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sH1ZtNzw7ASBY+TGObLJ+aQIZVnb+gkilqaMw0lmvhQ=;
        b=roQAJnBEgyXq0kboKEnEeV1iCPghEQ9B0oXT9nI1R6x2uqc2F+MV7XlOWWTtW2olFj
         DtAb+VlCMuXgdspmbwUrxXlTIVi8Ck5sfJQdsORWOKePgY9wDDwNMWD7ZE2ZkLtUIVDH
         oKcCm895ydEjKIv0yXkyJq+V0weBuwaJf/73Vnt9ngRJCkJlgNnXNUgK9/yBEtSK8Gsr
         0yWJVpxxS6KFmyyrWE05kRAJmPcPLIVhUKnrzXNZyH5/Jv2gMI+SybMZIIO5DbVD3xz2
         pg33yHjC0DhuzxBMSrD38TPVeS+RaLzffpHO8fBuxpkBkaFKvfC6JVNKcyZU4HRgbLNO
         wNjg==
X-Forwarded-Encrypted: i=1; AJvYcCVvqjOvVjqzhYYixhifOPC2+tVcuEwgHFfwzaFtwOJjmb+UboxK46S/HEI7eubWst+uXBKAgnzCrZMxjA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi7uefDmDXkpfUtMZ6g7QuupN9BsdeEVXVJ/LQ90TaceiHVJVW
	TV1fdI+o+z4QtXmxTrix7+J1gMb9lYQJhgbFvT1smolhzF6/LQRE3+2R
X-Gm-Gg: ATEYQzzDF+yw/SxmIIOlFEUwKvJ7LCtcc95flTEpmpCaMK3m8AJMukpZAiPUg6ZBgnB
	bjLsXaP4TMYbOff2GKZYBVbw0a7dK1hxle8IC0cdrDhN0jrTKymjEkDeYuDbeYZ7EZJhJhAvq5t
	ZeePPBgc1guVHKvBko//Up4H3vw5SevT6wNwiThVYBSQu8aM3I1/NanQhPBIgvhyYpbaMJCDJP2
	PROgeEvyq3shSTo29drRj1uihcSD7Afnm06qwNrq7uIfwIJAPi01dJUSL+iT6mC7Mdi+giwwBTK
	nmaqy/qOWyulaWQEd1dKHcGkA3PhrlkkXKrB76W2MqaA3hubv9It1FZlBSnnPnOsJBb9vh1nJFH
	2qMh7TSSrfGZ1JwXEgzXjeMauaV2S2uJB4NPRAnC5Xm6sic5lTdCyDnglyh51s1Hsz9ZdYiSgdm
	jgXwgdTNpOBwV6Gkb23lY5cMl2GG2N
X-Received: by 2002:a05:6a20:938e:b0:398:a128:d463 with SMTP id adf61e73a8af0-39c87a3c214mr8660465637.35.1774759736982;
        Sat, 28 Mar 2026 21:48:56 -0700 (PDT)
Received: from [192.168.0.101] ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c769179e31asm2899739a12.17.2026.03.28.21.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 21:48:56 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Sun, 29 Mar 2026 04:48:02 +0000
Subject: [PATCH v2 7/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR
 transmitter
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-ginkgo-add-usb-ir-vib-v2-7-870e0745e55e@gmail.com>
References: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
In-Reply-To: <20260329-ginkgo-add-usb-ir-vib-v2-0-870e0745e55e@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, stable@vger.kernel.org, 
 Biswapriyo Nath <nathbappai@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774759680; l=1301;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=pGKPix7XiEt441lKBW8Y9b0Y9EmW4lxtf6JcRfDKsWo=;
 b=AjUWH+AdSOG/5ukRpNAwaXcythhtMm7E9TAuzpnElRgLKa+TAvWs+43AuNxf5Ryx8NJQ1jxE0
 4oBI9xuIcl0AadPRbyVh5WjXVeiB3FcSq+LKxcHqBqYrYdg9M7tkFIx
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=

The IR transmitting LED is connected to SPI8 controller.

Reviewed-by: Sean Young <sean@mess.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi   | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
index f66ff5f7693b..7d8481173171 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
@@ -99,6 +99,10 @@ key-volume-up {
 	};
 };
 
+&gpi_dma1 {
+	status = "okay";
+};
+
 &pm6125_gpios {
 	vol_up_n: vol-up-n-state {
 		pins = "gpio5";
@@ -160,6 +164,10 @@ &qupv3_id_0 {
 	status = "okay";
 };
 
+&qupv3_id_1 {
+	status = "okay";
+};
+
 &rpm_requests {
 	regulators-0 {
 		compatible = "qcom,rpm-pm6125-regulators";
@@ -332,6 +340,18 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&spi8 {
+	status = "okay";
+
+	irled@1 {
+		compatible = "ir-spi-led";
+		reg = <1>;
+
+		duty-cycle = /bits/ 8 <30>;
+		spi-max-frequency = <1000000>;
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <30 4>;
 };

-- 
2.53.0

