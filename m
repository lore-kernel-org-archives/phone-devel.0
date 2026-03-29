Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFA927EFE9
	for <phone-devel@vger.kernel.org>; Sun, 29 Mar 2026 04:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774759718; cv=none; b=TwQYk4YYSxbAN91IxFXUKIZLR12EmVap5PGv7WscY2v/PlND2bvWrfYQE1cQxAJWIcLKHotkn29BCA5HbrMnC/pwJqQDOPSFESWb+k/11YeO1B8zUtC3vvOT0lCS2EBFcLYWVmzc0j5TZhN8hIQTE67xMLg9m/cjtvj3IdgTKXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774759718; c=relaxed/simple;
	bh=dSmdH/k7eoOG7PHFk1pjfGKztHp9W6X8Whf07jDQ+ww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z8V1LgTWuhYadDiATzXSZmqICmFgSd33iVt7EboecCvyhJYUPolkPmBHoQ1ND7RosXcHdFg8VxcQ5hR/GMt22eZ3P/s8omk+5qKtMeGQ3J82G+Z3D2slGgiTeKqzWqJxIpm6PaDUIQ4lvbj4iNJWILjxd/+1tHzZ0aWDvOsEK30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DqazyhMS; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DqazyhMS"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c739d32b72cso2192360a12.2
        for <phone-devel@vger.kernel.org>; Sat, 28 Mar 2026 21:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774759716; x=1775364516; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4PSFyUSbDPbuxXLaZDXDANomGT/xjqWL5i9LiQ50fiM=;
        b=DqazyhMSxWigUCEHuBdJyHc2ezmc+/kmxcKmhdhJiEvMTZ1S1QkMLH/aiMjxnC5PBt
         WV39dFR5wGEccr3koVzOyFtImKlvlbPkJPYmqIbD6T2xj7OOIVeVr9f4HKvNDN7DjSYs
         NmZSwaYPPVI5okyCwv8JyA4jdQpbwdXUIBj1gyPbxtyC5r5ZmpUe7A7/wZYIuUMEtCqa
         jq4bIYElXGn9zPym4NC0sowxOClk7D7TXT56sMk5pQ1HKMOpLj8GbOAu0510zaNyFygo
         Q1I6fNyg4aQvgetl/t6rWVsqsxtSJuKn5Qral42mZi+GLEYXAOU21JaIWa6KKi0sfx0m
         eF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774759716; x=1775364516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4PSFyUSbDPbuxXLaZDXDANomGT/xjqWL5i9LiQ50fiM=;
        b=UHXFWlNlzXqmArSb/j71BkV4tPxW0jMk9gNw5lc3nDXJPmwF4KDAZAdPRVVNDTwej6
         WDfPesWTlMCLUp2RLhYDknzq2ujoIwrI7UgraNv8d403w6EmrUxFc01e/RTBkmM304nG
         5BzRASyOaooOgEGvttUWooeCKKpf554jaCj1jdtD8IfLUz5EjXLWEEgF3W0bX7CJ5R47
         2A2fIpNtdbLIV6Z4l/3ZpfWYYBG7a39OfxW5yR7SWdPK0l8euednID33n01jAfR+43+j
         2Dk2FJIE/Ez1Nu256mezN53HnCbI/9RRlWrdndb0ZYhUZnO0j0U7vzFIc7stBSa/sT+U
         thUA==
X-Forwarded-Encrypted: i=1; AJvYcCWNspn1xGDjrlMSJZrePyYk4b/0Unpsns9oBUZhpwaPLxPu1Mq5aSNU1YoqLPkg+nFvO6NfknBORqFwhw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhjH0xBFkc81VmPd1GX/YgN/cGjUqno7eTM/mars/EB1eqTYM3
	njZOb1tXjCIn53InAyKH4NPxRmynrFevD8EVdItLa4GnldsNUA6pr0rO
X-Gm-Gg: ATEYQzzFCAlJoLmC2CUXS4FcYmQ/8UpMxEx8WxfcEKO2pFQkFPl7xb5MYzHfGdaWGG5
	bVfB5xaDZ0Zpm3NChV7bgSWsIuvOtyGC3bacmyzA5nxZu25UL2E5AQJYTFII5oARsweLVQRLK8n
	o2Ehj3D3kOZegbLRdKnmpwZxjQPDzplHvjuGPAC6GqFPbnLC4yTVQv//N4lHk1lhHnfsuTwT8fG
	8+Z1XpYizGNTQBCp9qNyDZmHzqO8QO99XBnmPZdLXntIwzsyQ3fW6mS8O8iHpcv5/HdrvaL1JBq
	5splIFbQCVzbo1SDfPtQossVoKByvwPyib0TAdGYlEpPirknwDsOzjhuSDufDedN9r/3SJGo5J/
	n4H3/7wiXpzha0X9F7+dZSrna42RVD+hAO0Yr/he+KWCEu/FGQX9QdxDAaUGL1m0zqbt97a7kaM
	/wdklvHU+WdUY2WoXYWDBb9cBlsCjB
X-Received: by 2002:a05:6a20:72a2:b0:39b:cd0c:3880 with SMTP id adf61e73a8af0-39c87abc942mr8576828637.36.1774759716542;
        Sat, 28 Mar 2026 21:48:36 -0700 (PDT)
Received: from [192.168.0.101] ([43.226.29.240])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c769179e31asm2899739a12.17.2026.03.28.21.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 21:48:36 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Sun, 29 Mar 2026 04:47:59 +0000
Subject: [PATCH v2 4/7] arm64: dts: qcom: sm6125: Enable USB-C port
 handling
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-ginkgo-add-usb-ir-vib-v2-4-870e0745e55e@gmail.com>
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774759680; l=1049;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=dSmdH/k7eoOG7PHFk1pjfGKztHp9W6X8Whf07jDQ+ww=;
 b=GM5n8XUOUONfpTli9uJYWckd8fI5avmePflwEDzxTfZsx2RQwjszif+loZsDybWFVSdzFqK+j
 eH3G8XeAlORBqyrmo3sAktIB8cr4uekcn0LEoIBGnm7E5sJG+33BWIu
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

