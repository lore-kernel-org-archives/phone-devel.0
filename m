Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F231EB18E
	for <phone-devel@vger.kernel.org>; Tue, 11 Mar 2025 08:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741681465; cv=none; b=bDoIDCGTYudF4z9atLLMF9ABYebdq8z1oaulHMnpApT2SQVXQD7G5DAXvSouavo1MmnZSdkkaRlK+QWrxJVANaPYM3SIOt7um0Ov9XNsAL40ga/iL8LOP+0KbxRe5QfWhj6TJI6yw0o1tSvxq0YhfOUcWApoy5B3zQHgLZ/FBhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741681465; c=relaxed/simple;
	bh=xu3zP1HoofD6juWhjBldyocKjaXNqT0I+Ivbyr36UBk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aXu75jQZKONCVJ1BH6SRN7SCXadyhwVu2l/k7+pzeQCr3J4yphv8/EpStR4UM6MIFUpdL1gnMFwARiyIbTd/kiuqzaVw7pZZ4PQkVK9TohsuZfu4OqZG4xPPPZHWJSaPV2yWy29TZBxW4GtcDCtq2b/D5SveLbTifRANnoYy6iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=sRPUNWMS; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="sRPUNWMS"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39127512371so2859154f8f.0
        for <phone-devel@vger.kernel.org>; Tue, 11 Mar 2025 01:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1741681460; x=1742286260; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MkuwlZJMUyuJz7nY/CVS9mePyWOIvMtEr4YIIpcR7vI=;
        b=sRPUNWMSVCVA33WWr3T+aN6HEboHPmysl8eDIiLjY71lRrzl9PhVLh6+yEtIYeejjR
         nsSsuNDNFAiic1lg12XPDRxEzsjI79f0/Qjg8KdzFdTkWz1AdJ0Qs9pJbRQIIt37zYGP
         +ns/gnuwHufskOB+rINsa/DtIijImFioQubkppvCV7FvWwKdAE71YwzlJr8d9PRs3yMw
         I3IMrPrw/68wkDm1vNfBnlEAzsoizbePairK6aB8wxZcXXcI2D+UnZ9wQ4ks1k2qeWLP
         XOkOWreaBfvSu6ZH1BhzGQ/B45LXbhh7BqGDse8Oyc93qRHIAKFA2IukarzhsRSMip/9
         JnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741681460; x=1742286260;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MkuwlZJMUyuJz7nY/CVS9mePyWOIvMtEr4YIIpcR7vI=;
        b=hQlffL+OTjydU4EIPMnkgTEnPorx5XB0yI1Fg0GhDIUa6b0N1noCzTc1iGU2AAW52s
         9jgrXQk2QjovtfTWiVrbg27ML5g//AuuHoxH2+iPV4HJQduQ4VEHzAVfFP9CpOMjavam
         hOQQGx7fCM/pCfbd6Slwizvy+H9yRFrMFk603KQ0FOzDMXcd3DUJV8WT7DOPgp0n0RUM
         nnzGDsdwSrSK9+6/sSFWxUpnMlDpRgjdLE6Ga/9FSGcVxfGfsJCR6zeXPNWDrtNeGVUn
         nVcDZsr6tI8aS4LZgKx0MLs83bMQGMnbXpKxhZhVJNk297izVhdk/36JVbxpjWrDGjcE
         VsMQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1tCsw7cGrO3YSxqLY2c1C3OiAy89Hq2w8zVoF6Cm5071gp8Nn4PFtHoog63EAQ8tu/9H/370kXJUugw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpKZ4L1aSK1eom6asw/SiZVQqGKP5svMkhWwpbOezufw+DAD1X
	PdGo+gZPxAYvuJwFR/hfT3RrnLLLWdTeEu3L6v5JOcjgP615vuEe/8iSIIVnY8w=
X-Gm-Gg: ASbGnctsJV9XHXwE1JdQ0l5EcjhWK6wiLZBhcH+hl4V+2N6OrbDCnE4L6LtoFOPBlOg
	mkUGWzvo45d3HE6VL3sZW7F9gRY03XiXFs+A98nu3E6yONRcJzC/UcZqwLuw0Dv1OiZRIAoVRwE
	ZjEIYURQZsQ8a++TU3uSRE8iZ+Arnjvuq5tWT/7vSaIgZYWsVvvFttnWHpMn7eg2XUSrqOoWOV4
	sjb1EDoWoWpuuDg1zo7A1tbXzERTljxBouLRjquWqWc+09VA/864n4/WdQ1ZB5VNRRLc4mRHVGo
	Pbu3keruKjq+rNUJxdvttnsLrK5WxnvsxQ13i2ZF5TtTsodg6JK1e6yBbKsj7TZvA90XRqE1JRo
	mn0ovxRQW8j6bl6P9BA==
X-Google-Smtp-Source: AGHT+IGcMWouoW5czhBbn4yWMxCe7rFrkdK1wII/1naqJaluMq6AQhQYDYrv/8Bujg++Ac3Li9uWDQ==
X-Received: by 2002:a05:6000:2a3:b0:390:efe7:20fa with SMTP id ffacd0b85a97d-3926c69b312mr3431264f8f.47.1741681460573;
        Tue, 11 Mar 2025 01:24:20 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ceeb5995esm90826545e9.16.2025.03.11.01.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 01:24:20 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 11 Mar 2025 09:23:39 +0100
Subject: [PATCH] arm64: dts: qcom: qcm6490-fairphone-fp5: Add touchscreen
 node
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-fp5-touchscreen-v1-1-4d80ad3e4dfc@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAvzz2cC/x3MQQqAIBBA0avErBNMK6irRAsbx5qNilYE4d2Tl
 m/x/wuZElOGuXkh0c2Zg6/o2gbwMH4nwbYalFSDVFILFwdxhguPjInIC8RxGmWne2s2qFVM5Pj
 5j8taygcnJb1iYQAAAA==
X-Change-ID: 20250203-fp5-touchscreen-cc6960134dab
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jens Reidel <adrian@mainlining.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Add a node for the GT9897 touchscreen found on this smartphone connected
via SPI.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
The series adding support for this chip (incl. dt-bindings) has been
applied on 2025-03-10 to the input tree:
https://web.git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/log/?h=next
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 356cee8aeba90e21c11f46df924ed180bfce3160..35ce9dfca6f092a88d8873673ff57b591e210b02 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -1069,7 +1069,18 @@ &sdhc_2 {
 &spi13 {
 	status = "okay";
 
-	/* Goodix touchscreen @ 0 */
+	touchscreen@0 {
+		compatible = "goodix,gt9897";
+		reg = <0>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <81 IRQ_TYPE_LEVEL_LOW>;
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
base-commit: 93498f5ea4d0415cb5a95680224335651580cf08
change-id: 20250203-fp5-touchscreen-cc6960134dab

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

