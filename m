Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AA03BE163
	for <phone-devel@vger.kernel.org>; Mon, 30 Mar 2026 10:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865689; cv=none; b=gADW7UneuMP/xct0MyiT70Dcjf66EVXDK6KY6w+Se9Uq0uC6ask9XZnzcpdPEWk7BEn5p6qzxkDYf3FyBsLFrgM0Iynv6s/5T4FVSOLZf4k8gvfMEN9ogahdcLBKGSHTh0qznZLkjkbczQymH3s68Tm07ifbHzG2PFbwkEcLWRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865689; c=relaxed/simple;
	bh=dSmdH/k7eoOG7PHFk1pjfGKztHp9W6X8Whf07jDQ+ww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SXZ7/PZY1IgVqFWOzj2+QH+R82u2DyA+9iAyRgVXFJSSPy4SPjFHe5XXSgzPT/t6PM0KMtNfrWFfYySKLCSSjNPBQbGVXP24Eeb9GheGeLCsbn3fjFDyOFjsVb9udglK7LZbdmO18hdJexbkBAyNiUOcVABe4wB1p/tsBCDXbzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cb4forfJ; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cb4forfJ"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-829ac4670c4so3151320b3a.0
        for <phone-devel@vger.kernel.org>; Mon, 30 Mar 2026 03:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774865688; x=1775470488; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4PSFyUSbDPbuxXLaZDXDANomGT/xjqWL5i9LiQ50fiM=;
        b=Cb4forfJmPguPBj5wxq+xZrPwGKgQeIsn+fftV5JAGbl8OZnG+v6sl9Y0OFKCH0kjY
         8mYBqSeXhttAzeORh6NRMUKeYMVgqit1jLGfwshCAuofuJZNZ6mucezhCqY0XgUmx8Tg
         fI21MIpDusWqrNXKTP21Nkk3AGV/u7tjZ14VEvMMpPcKH56AT/PHRs88wA7avo1J/z7o
         MB2vDLRkhbbntfzLLuxfLul5klbpyz8EldLov+xsFa85Z31k1fq+5l3lMMCpKCPZ1p0U
         2dTriIuO+tZeQyJ/HG8bqvhF4ry34/NYThTDAuby7PVRNZvxpCPXdS32PuKNurNEsLhz
         UhrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774865688; x=1775470488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4PSFyUSbDPbuxXLaZDXDANomGT/xjqWL5i9LiQ50fiM=;
        b=h88rC6FojzKl6WhbMkYJhyiFMP3B1C1TYWnLSjm0shw6kFdIon26P+T8xZRazyfx/W
         pmC/zsht/qYyRGrhMjxYff0i2SprwxVrLMg0yCZ8du79FK5WUHWiEgLHS4Xh851xgLvX
         lfezO4FntQAGOF5Agrj8XUyKu2yUUgwivwXxVVPDfRkxCVhMTKviOnnaha/Zyt/GhXry
         r8zSAeRbLnMf6QWyQ5l0hXHuKLFNJxoe3oywzH2KjdZYyk39bzUP76Ujj1KNMktoweQh
         qsrkbxBGf0TSY8EjM7CgUL+6lx4Xk+kR1aRNOLaxEQIRgTQUJSCpi3zTpp8Dx+zMPuxA
         9Q9w==
X-Forwarded-Encrypted: i=1; AJvYcCVSEG/gOsaDZrpvOUiBSWt1yKCVlChR1pRFQL0hzH09g1JOynpp5ttPdgA2DM3hqBDQuvSYYMDPnarFyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNmlgiLRi0AMa4MAE+UfSqLtTdm3oC9NPfcLTLNX+Gvc8DgJVx
	YSd7CC4118IYM5PIcEsFmNtio4Iuxqsx1bkw7QdxBSw8uMOEY6nEr/Xs
X-Gm-Gg: ATEYQzzgC4spPaZvhi7vHOChbe22urdRSA1R3TuN4Ms73P/qH1d2dYT2YrVxpo6HAnw
	FAIBOLlFjnvaWWoaLjArxsRQvkOjzIbRRaHXYwHhpi/oCO4USA+ugZhW9/bby6hCxEnJPtmwDQ4
	oroFOlzoXFQ+554tvVmC+IXdq8K9OCucQ8OPJWDRUL3/evAyw0UNSOj3sgGSdxWefwlqYgBSK/j
	ewuSjV/3hdRf14omX7cgKL9wOOFWFiIYWeNvrIqZy7AP7mnRaud4D45IpiOECApwnizY7/4PBzu
	pUgrg4PhX62W3zRuL63OVNFukn9pWNsHP4cQl+S2NDbhhtTSDqX3TSZPbVPwTqcUFbx7vJLPqpl
	W0VbC5cPD2zvNkp2cB8QjnIS4N+KAH37OeeV72D+/SR8z+oHwYCtW2bpbCp3wvxhX5mDezO16u2
	eHK6BIupAfvfu9Gguqdv+n8AkuxSzq
X-Received: by 2002:a05:6a00:4107:b0:82c:20e9:fa53 with SMTP id d2e1a72fcca58-82c95af2c3amr10551087b3a.5.1774865687558;
        Mon, 30 Mar 2026 03:14:47 -0700 (PDT)
Received: from [192.168.0.101] ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82ca843d8e5sm8286080b3a.5.2026.03.30.03.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:14:47 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Mon, 30 Mar 2026 10:13:51 +0000
Subject: [PATCH v3 4/7] arm64: dts: qcom: sm6125: Enable USB-C port
 handling
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-ginkgo-add-usb-ir-vib-v3-4-c4b778b0d7f8@gmail.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774865654; l=1049;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=dSmdH/k7eoOG7PHFk1pjfGKztHp9W6X8Whf07jDQ+ww=;
 b=iN7WUR2JFdKInanyaJ1nA7GlY5aCbeqHHyFtVL3dnjBxgeZPO8T73QxVOJKURbwx2GR+gVJdr
 PY0C+yTcSTeBAULpEXuamFoFN1U6WYjq0Th+2JdlIdUJCkN76sfl8CA
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=

Plug in USB-C related bits and pieces to enable USB role switching.
Also, remove dr_mode to enable OTG capability.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index a1a296f90f44..d26ca1637330 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -1241,7 +1241,20 @@ usb3_dwc3: usb@4e00000 {
 				snps,dis-u1-entry-quirk;
 				snps,dis-u2-entry-quirk;
 				maximum-speed = "high-speed";
-				dr_mode = "peripheral";
+
+				usb-role-switch;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						usb_dwc3_hs: endpoint {
+						};
+					};
+				};
 			};
 		};
 

-- 
2.53.0

