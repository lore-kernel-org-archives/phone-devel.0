Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14ABC38B14C
	for <phone-devel@vger.kernel.org>; Fri, 12 Jun 2026 10:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781261767; cv=none; b=b4ozuny+sRHbm8nU3bURwn+KFrjhnDg16ccNFSE3vigPzEgzhmyKCuxWY5Jo/updaKFQLArTFdoSuhlOypYD/CuUKQhjdtWkCc/R+d1yP1RuJKIJF02cRKM49vKWboyc3U4TyoRo0ZlGg7He7/VtI9QpJvJNceNmOjNAklLn0so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781261767; c=relaxed/simple;
	bh=S/OHGyWk5LV2U9rbhDbzhVoexTBv/UEfi50dRxV4F04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u9piEUMZoJW8N39KkJMDklSebEwjxoE71EbbDUhpEtJe9LH0pCoEn01k91OMVRIqNyo8PYfZ2Ar2XPOWdM+k6fFXqn71zhyM3Gg+b2k2tvP4Mr/IoDKVNPAZJpaC9KtYWz+TrEea0Z4HHsnGQotAErb5utqW+p0I//N8eRhudhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=bSSBHPbS; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="bSSBHPbS"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-bf046d4da1fso81769866b.3
        for <phone-devel@vger.kernel.org>; Fri, 12 Jun 2026 03:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1781261763; x=1781866563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3GED/bZKxrj+cOmGbidsM9t/QHR2Y/ZoMvrWHOWRa/Y=;
        b=bSSBHPbSJtlhxc1qw5Y5n4x7cGddhIslOBngyC7729CTQR8j7XAJOXYhgszsM4O94N
         XGZggM8FQxtFicLRhX6+gmhhhziym+jNwsJsDhyz7y1VhmWXcB+s7iUai3r1otj8UuuK
         hUqhxtw0pmp+RfZzV15b7Y1XrrTjWLE+vLgwEgCEebErXiu4SsoXAP9gTKVG11YPSyH+
         vrWO+2SdhWJjSTC5xUSCJAOSUJntef7Fpqh4CFaFiZyl5GQGYyBLscOkISfAsqx1pVbH
         dk2JPq5f3tZysQtGLxMYVKzZ4e5qM7xPhrB3SreI+rc3LvfW5w5U7SNuAItIfXVPssic
         xm4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781261763; x=1781866563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3GED/bZKxrj+cOmGbidsM9t/QHR2Y/ZoMvrWHOWRa/Y=;
        b=mfHq1MDJpJ4TSHP8q2EI+dqCxbUp9c3aUiFPI6XkCw+bMhbg8GsKmbxawtjCv3R7ie
         i+KD/W63QXaeiboztA3Ubfjwwdln9DGs8YvY2r0Ejm6Lk/IxBPgzStZBuKOIpLIlJ1vK
         n01ATkGM34TOPsinZpKRN7dmfAdVMz4bb/8cmTA1iNV7czazvlLyQxuJ4L2pL/ncHg1C
         YHBdY0NssbZ8XhTe4DfD6iaGtgaXicBkkRZyIOc2j6uq75eE6x2BXRwr1TgMEyPCE2PZ
         qCZff55WDm+sxH8Xoz+Hemi8glSL80qbZ1w/rwozAzTdfQ33J0gEO16Nih+g8MxM4Zyu
         XbmA==
X-Forwarded-Encrypted: i=1; AFNElJ+BPcgsf78Jee6A//q7MEpbSZ9wpmX0B5ZEuOy/M3ALinAbLR8CZXo7+xrz/+Qs/wP791E2B15SpO40EA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl0D588qEVrvKmOtn7jnFZiJQrrGyYEK/mxZTf+5eYbUtydDnB
	zcJUSCWR6bDhj8tBD49tpqOtbJZ0biRz2ZDIo9+5+eAO0iavSBbmx1dVkHLFBL41//g=
X-Gm-Gg: Acq92OF891gcosHy6pta+Y/JDe/IeRQX7C47Mof0CQR3SVyB0VlQeXo/I69vlrMC7hJ
	QMsNrIacxrQ7eB22TifhZvApvPf8XZ6a7seu45MLEahaY5GEanb62jjcbb3dOAUcXSrzGOogAlq
	PfiaNJ4hSS7xKL/AnyT7vkcgOVWnaKXCwpqX9E909gdqb480LjM0zPjZsfphFBkgpVjhtGDpZms
	klqyCXTNZjwK2Wow2qserHoQdEpdps+qLmYkHRl33jRt60WXjMInPPqS6cFaAIztvU4u1l3TcQu
	DHNHeComAu9APOws35Jm84sdqLtyREdk56yrPGDOnfXqT5NUD35FiXt3rYsSmWOGikgk+LYdbNZ
	WjFZv+ONgeOOmw2E+mNXr4Lct+uftyDBAAqvdFR/nPwWoq3qUHNppEgjxFE+MeXIgtB+enaW7O1
	7YYOHfpcehVYCQKl5KRn5IxeSqcyYg8U5T/2jbTkPzLc+5PQuQ46Y+mb+RVAn93j9q8pzZdzlQh
	Vy8KefjkDxrLfVt40g2V6uqz2w6RDUHBFLzu33RbaKUNjHc
X-Received: by 2002:a17:907:2666:b0:bec:fd3d:4072 with SMTP id a640c23a62f3a-bfe2aa00d74mr64211766b.35.1781261763397;
        Fri, 12 Jun 2026 03:56:03 -0700 (PDT)
Received: from [192.168.178.182] (2001-1c00-3b89-c600-b4d0-bc9f-f60e-913a.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:b4d0:bc9f:f60e:913a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb8b23f8fsm91583266b.53.2026.06.12.03.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 03:56:03 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 12 Jun 2026 12:55:52 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: kodiak: Add camera mclk pinctrl
 definitions
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-kodiak-cam-mclk-v1-2-fd294ff003a2@fairphone.com>
References: <20260612-kodiak-cam-mclk-v1-0-fd294ff003a2@fairphone.com>
In-Reply-To: <20260612-kodiak-cam-mclk-v1-0-fd294ff003a2@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781261761; l=1957;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=S/OHGyWk5LV2U9rbhDbzhVoexTBv/UEfi50dRxV4F04=;
 b=FdrlD65Tt+jQROey8o9bfFEL+Xrzd4VXeXPMORyYvZw1uA6y16rBv7K1/M3qepAm6F6n5WgYQ
 B31+8R+lEdyA2f3DOrsHLDGMCHb61spniDoyjLIUdnEgCYGV7XHSw4E
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

On different boards the cameras are connected to different pins with the
cam_mclk function. Add the definitions so that mclk0-5 are covered.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 62daef726d32..903937947811 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -6505,6 +6505,27 @@ qup_uart15_rx: qup-uart15-rx-state {
 				function = "qup17";
 			};
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio64";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio65";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio66";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cam_mclk3_default: cam-mclk3-default-state {
 				pins = "gpio67";
 				function = "cam_mclk";
@@ -6512,6 +6533,13 @@ cam_mclk3_default: cam-mclk3-default-state {
 				bias-disable;
 			};
 
+			cam_mclk4_default: cam-mclk4-default-state {
+				pins = "gpio68";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_default: cci0-default-state {
 				pins = "gpio69", "gpio70";
 				function = "cci_i2c";
@@ -6578,6 +6606,13 @@ pcie0_clkreq_n: pcie0-clkreq-n-state {
 				function = "pcie0_clkreqn";
 			};
 
+			cam_mclk5_default: cam-mclk5-default-state {
+				pins = "gpio93";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			mi2s0_mclk: mi2s0-mclk-state {
 				pins = "gpio96";
 				function = "pri_mi2s";

-- 
2.54.0

