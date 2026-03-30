Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66D43CC9EB
	for <phone-devel@vger.kernel.org>; Mon, 30 Mar 2026 10:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865711; cv=none; b=q7VMOJnfknYzHMAZJI5SBsDo6wnzNgJvn4AxSxJ2JLw26cxcaqHc1TYI55h3xnvRO6LGIiA5qgat+uKdAj0sDYNFUBkd8gn1GdXIBm9Sr902oFbUQaAVdqDn3u02aVxXpP8moYYubVJQf8URKYuBZ4+XJQ255Iy8sKSbNgcEbmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865711; c=relaxed/simple;
	bh=pGKPix7XiEt441lKBW8Y9b0Y9EmW4lxtf6JcRfDKsWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ay12rf99lfkzWw8qfsZWic3YfBGu0YoP5poLM8LkL4Z9QrSu14UoJ4K2PpkvAhAKvw6avDA0LuHWnXNIuDCv6PP7eIVUM8MkK7r6Ou/CrmjpRX05VQR6q9+lfrwHPvgZ+irNWLjLEUaCbhZXOMHyEIir1LMVPVg0s3OceEpzt8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sv0tyoy6; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sv0tyoy6"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82418b0178cso2049319b3a.1
        for <phone-devel@vger.kernel.org>; Mon, 30 Mar 2026 03:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774865707; x=1775470507; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sH1ZtNzw7ASBY+TGObLJ+aQIZVnb+gkilqaMw0lmvhQ=;
        b=Sv0tyoy6y1m8vamSJhw4Y1e3YgyRjEkT6aEqjtIupF1eRncGJ1m4CAfs6wnFyn9Gww
         OtOmh+loTqGPp6Uf2BY3mAmt2v7yqyLub0xT6URbcQhv9szKZ6NwppSUMFpn1Q/gccHM
         36d2QdPbD0ljFLRAr8gQI/Nx68y8i9t7o4OrXNT0y4G7t3C35dW+ago9axHC9s61O5cg
         HhWqjl2uamszvzw1XKV/aTTsoPY95emUcJlXjBuZsAcJnOpw2A4bbVPAZ5whS429W5dl
         Z44tq/I6ELer9qPZDLqwAXH0siYqdx9aaNImzamOiweT++lvXGxwysmbf9VqQ7zKPaCc
         JlzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774865707; x=1775470507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sH1ZtNzw7ASBY+TGObLJ+aQIZVnb+gkilqaMw0lmvhQ=;
        b=juCiGnuYn+IC9zA2Yj4n9K9o8P3Lo6dWq0aCTElV1zE5TCLAtC60RbWqewfyFXYgZK
         lEhmmTHEOoimz7qkPsP0ykZLouXWM9sBFzYmkl32EneYpRZX05827Rzx16/YxayEEpwH
         qz1evPELL5lqwAXCM9bSyWTN0ApgPnr8B1ZCWwJJ352A3n65P6+fvDK7olteM6o+aMpM
         1243PCMbq6W7ILOSMzqtKF9CYTLmuQYMIteN8ibwThRJ3co7rc21g7L/53Yu9NYv7sBI
         ooswqNQJA6cal2vN9zZcywYoCX23TKrfVxpdgE+d+nZ0MqCgP8fWTEJUDWtc5EPxKMBA
         s06g==
X-Forwarded-Encrypted: i=1; AJvYcCXpNa6nA9VI3d/IzkUI5gi4WacYqu7N3Cgq+oFRbxKr2c4ZcRumqnuP2ZK0OknOrgJ/4h3n9Jdpeez0vA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp0J+qeBhzt3YNCHtFxcCtnt9UC38IeqE0f6ygossaE85GQLQa
	JYbt01F6SOiuQnF0j5fYxDVpdqaW8F8zCqENv4azjg+C7s7CLUQBgDOa
X-Gm-Gg: ATEYQzx0cfx+9JmjrQshecPD1PPkeSwU9kFlmeasLzRQrNsWo6efoD8p4KCyrh586Th
	9z5Pprj8SDLs6yjkQp9uY00So2uQ8F77aK0ouWfwKIcO27FggebnoklRIhJM1a0kPBS/Tf7J0nm
	P3SUA6jQQd1xqmsqxdYH0uGcJ++RhmgRte/mo9zCQlRwvlegmR3Ebp8xaS8YqM9jXI6f5LMj4P7
	tJs6AmDBV72kpv1wuxC5pxoqveFtVvTLCvlGvYBezjQkqCfSNQLHDWgS0GMRxqCenTQPck2estG
	k+or6Fau9QzFwQB5x94dcWSubbRLnJwrOErLtjEpCxXTjfLRnWQg3i/Y+RnKflezs2GUKUqkXfV
	gwkimLmWaaOJWr0GI1KaYVE3vlOtyjzJJMMJLX9LthMf4QW7jFJotn2IrjfJQ1ZCYlPJ3bfdGDO
	VmiozzYmxP41K397ECFk47jwiAkElw
X-Received: by 2002:a05:6a00:815:b0:82c:24d5:63e6 with SMTP id d2e1a72fcca58-82c95c23e4bmr11933168b3a.15.1774865707088;
        Mon, 30 Mar 2026 03:15:07 -0700 (PDT)
Received: from [192.168.0.101] ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82ca843d8e5sm8286080b3a.5.2026.03.30.03.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:15:06 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Mon, 30 Mar 2026 10:13:54 +0000
Subject: [PATCH v3 7/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR
 transmitter
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-ginkgo-add-usb-ir-vib-v3-7-c4b778b0d7f8@gmail.com>
References: <20260330-ginkgo-add-usb-ir-vib-v3-0-c4b778b0d7f8@gmail.com>
In-Reply-To: <20260330-ginkgo-add-usb-ir-vib-v3-0-c4b778b0d7f8@gmail.com>
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
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774865654; l=1301;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=pGKPix7XiEt441lKBW8Y9b0Y9EmW4lxtf6JcRfDKsWo=;
 b=BedMsNwgLsE+aubdatQlTumTqlUwwOUjk7wfR9tZkRnU146OE2yO8K9gEHsRM59RMMzWQu8Bj
 xCT//XetsUpBloRKCMDWFBx1AzBe6tLOnxEoko2HAI/0xT5MzpYD7eZ
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

