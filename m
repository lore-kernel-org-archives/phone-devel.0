Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABAF48C414
	for <phone-devel@vger.kernel.org>; Wed, 21 Jan 2026 13:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769001994; cv=none; b=XkY7/w1KM4Ra19qgbr36kw1omX480853WpjSDlYJT0q5NFJ+Du8qVzSYBYuyiu0n4sXX5oFMEmFA71j7vbONeEbzv/Rc4I72WqqpLQByQ3NlOb7K9NTy6mekZBFlwzZVv6SEDbKpd/HeS5KjS+4m6QA2FGBXDW6tDu6P4yLbACw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769001994; c=relaxed/simple;
	bh=vT34X6xkb68tPbS4gRp9qBYxaeoKQfD8bI4dASKdlTk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fl+zTfZUi3jhB8barW0PUPh044mUYoCqwBVx5Z6oAfZiIUmori/RD8/IrF13sLB6JnvZYyP5SEcKRNB2dXAxxK5zll5dRlv8DJ4lTKf34wH6QuPUmfMakCPGYoN7voVLI489FLzVM0EF4nnF6tXu7+CpSxH5pziIQT5HiuCvpu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LHp+2RiD; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LHp+2RiD"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-29efd139227so43292945ad.1
        for <phone-devel@vger.kernel.org>; Wed, 21 Jan 2026 05:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769001992; x=1769606792; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6UqvgwyO82OPHh7jatW0k+8VFxz8uHhNnaHT0APn47E=;
        b=LHp+2RiDn4Pojg6vicZqbIcwPqytKO+Ux6aeM+K7CC/Qrv9Eip7p8Rz5BqZQVJLdwz
         vJcMXvBCl0YQb56r2rvURlCs55BSFPczF4m1vVUMOoNjQUXiKjnhG2P5b0LCaXkg5h3M
         wrEskPRJj+jY07Jslvgjqx+cKesKw5GL0AA7j99Jy5e0a5lwpPS/fC0YbgnPAfsRUcYq
         XoX3zegOddMq6DDOElkIsYPne27n911k0g6PaxyJ5F1c4xC4r+M18iD0rshNCOVxBlto
         7TI4isVdMFaXvU8PVYPw3VkczrEEQSDkrFWvwsuS657D2ddoav280/CBrj3xVzYlnD1O
         7+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769001992; x=1769606792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6UqvgwyO82OPHh7jatW0k+8VFxz8uHhNnaHT0APn47E=;
        b=dxoxJncnirzkVA3On5Y7732KATeKlLk9RfCHLfQA/DCQgf+rmp8JWya9aBS5c9qI7W
         2lwY3b+eiQkUs4BXSdcNGjz+w9NObaxo1rbZ05aD8xSevt6JHHyFCXY64TXkWC3tPi7i
         FEd4UI8yUAMhl0PewTlE/8EZYJ5gGZ3tezIGnnbbd8LO7QikxZzTzuyoOMzu2M+LwJCP
         gM6edg1/zd2i/FO1nSctYSGYANklb+xdedZt26c6SoBOdGXWxEAVIAYGmWkB7ded8+t8
         /0N+CfhKmWRiTQh1R/uLgDvK1MSQGoLDcy6ORL110TkB+TyZcJgBVNCHnYRuTXo87pNu
         lWdw==
X-Forwarded-Encrypted: i=1; AJvYcCVez4XFXuYoMzn0/8lSxa+L5p9G5Mdy+MstpEDjNOuiQKqtjdFWgqY0JneEEsmj1iqjSKCBoBK4pj6V2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZNHOygEEaP/ZX9YPHhKuGnU854Rvp2mWhiwrzgTtn1zjowyuq
	7f990NbxgnDhPS3TSIwjBYKOQvKYaj0gMWdoyPlxQEY1uX4lG0oAmc2H
X-Gm-Gg: AZuq6aI7JOegud7kjsqmcJFzAs0bioRXNhbsKBX0H/rYoyc9Tzjdg/iOAZTQslKV9Co
	TIovyRSDTOqeI17Y8P1/O/RZmquPFw57pmd8b4/4w/Ezrx5K/g5V1Xxot8p1X7dLH1VjmuNFRka
	tP/Enx3MQKpyvhc4h5KmlsILUWkdSvZbzPEyc7GTFYzbGY7MXrcpRi+d0jWkGcSuxLmm+HWZRPF
	voRiJqAMioLcDNgW0dp8JL5ShAFEpojFjrStNFFGtBKvJWtN76VaRaEEa5ui4g9Bjsd0dwOzCvl
	kxMoI0eF5VfyF/gGGF1eY5oN/37h8O0ePsOQ5xmGPYaydOsqjLUtKxcLE0mZYjzOSy8YlmQkkOO
	yjnZ3nv4SEamrgCo/xlMSXqcCUx6bob70XU29HZd3x6sgkkBvSJsASk5U7Haap/oW4SH8fNsWvp
	Ch0Jc0crzpZN6PaxAf
X-Received: by 2002:a17:903:2f8a:b0:2a1:3cd9:a73a with SMTP id d9443c01a7336-2a7189482fbmr149873705ad.40.1769001992159;
        Wed, 21 Jan 2026 05:26:32 -0800 (PST)
Received: from [192.168.0.101] ([45.113.101.30])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a7194164dfsm151487235ad.88.2026.01.21.05.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 05:26:31 -0800 (PST)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Wed, 21 Jan 2026 13:26:17 +0000
Subject: [PATCH v2 1/5] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Fix volume
 up button
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-xiaomi-ginkgo-features-v2-1-fb3ee94922d0@gmail.com>
References: <20260121-xiaomi-ginkgo-features-v2-0-fb3ee94922d0@gmail.com>
In-Reply-To: <20260121-xiaomi-ginkgo-features-v2-0-fb3ee94922d0@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769001984; l=1268;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=vT34X6xkb68tPbS4gRp9qBYxaeoKQfD8bI4dASKdlTk=;
 b=UwOKiETrMako3NLi3SVRzltWFBuYQCNiE1KWh9EzACbw/J1t3sKXu8PfccbXkGnMs9HKc4iv5
 M2LdtZz6yENB0lv4GwPx+CB+6zUYccBz5WznkuuQXhgpt31V7Tp62s9
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=

gpio6 in pm6125 is used for EMMC and UFS thermal monitoring. It is
changed to the correct gpio for volume up button.

Fixes: 9b1a6c925c88 ("arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
index 2605d0c94..6e0333378 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
@@ -85,7 +85,7 @@ gpio-keys {
 
 		key-volume-up {
 			label = "Volume Up";
-			gpios = <&pm6125_gpios 6 GPIO_ACTIVE_LOW>;
+			gpios = <&pm6125_gpios 5 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEUP>;
 			debounce-interval = <15>;
 			linux,can-disable;
@@ -96,9 +96,9 @@ key-volume-up {
 
 &pm6125_gpios {
 	vol_up_n: vol-up-n-state {
-		pins = "gpio6";
+		pins = "gpio5";
 		function = "normal";
-		power-source = <1>;
+		power-source = <0>;
 		bias-pull-up;
 		input-enable;
 	};

-- 
2.52.0

