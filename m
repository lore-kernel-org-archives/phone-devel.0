Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.192
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794171866;
	b=KOL4Ep1VUVn8xb+4uzkrBcc06WDyDctE2BOhws1m+gnny0VQnRlrpFO+hRLyzQYkR668
	 6cTlL1ANoG4kkXZPuEn+cK2x13wxdNtsQvrqq227l0V54l8Ru8ebmREEqYBwi1ZtQnesI
	 qO7+L/YUdSjAdrPb4PTSWuB4PpGC/YU3MBj52JKA+ctT0+5YlFlq0ga4SxeGTLThXCHYI
	 xMFwRPVuaoM1txePifwC8hNwhTbmbyYoOoPV6oGdRaH2+H4KfVLk0QLgfggCfDSOfBzsu
	 Ohjh+CPFEcOfjhiM0hCQwNdFo+vKtXqoj0haZWT493LwsoPRtUARZTO/oeNVbywhvcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794171866;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=kM0sWvRqwyaIM4HdtAWV8nIOqnkjhOyPwGDTfyVbww8=;
	b=iJpUYe4DOSHz+aEoXR2lApS1ebJDfhfyR6vQHxRE215DWFA88fzS3w5BRGitiyvoxXxt
	 5cMtc2Fi3imj1pwnTOiX/PPlqgEF4ZW5oFw1vGBjO9fqb/FC8EMT0zjTuH0eGM4p03Pog
	 eYZIfF4lJ7VAyrf0qu+3atfeKgs2fuLaB+M9nT+f82Ju/bF9+oZmEjE5Jyt1qmLVpIwdm
	 yldZ3YYR2lnDnAmt4ENskyHE0mCxTr0v6FPw9NRNNmDKqlJktksBls2cUWofuyU3vyx10
	 YOZuJReWrSuy2oCxomwDVCusPNoQgQh6EuqGYCrXswomMh4mdEYTcgjyahLRQYr/+hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=postmarketos.org;
	spf=pass smtp.mailfrom=postmarketos.org;
	dkim=pass header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=iJNt7lPz;
	arc=none smtp.remote-ip=91.218.175.192
Received: from mta0.migadu.com (out-192.mta0.migadu.com [91.218.175.192])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFF1606A322
	for <phone-devel@vger.kernel.org>; Sun,  8 Nov 2026 21:04:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FFF1606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=iJNt7lPz
X-Envelope-To: phone-devel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=dTluY3wL/0sysZUPdwzj0pTG3UDe3WWaIsxDKVUtncE=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794171858; v=1; x=1794776658;
 b=iJNt7lPzscNiipTeRHB+OOf9TBl8sVQFh98BTKVYcUCdAE3j6+v3VxSkstbwwDnnWzfp+unR
 FqZmlmOCVkwu6S2X+pgEX2Iix43gQoU7e1e6no51v/XskDy2gLYQQSOyfj826TcqenCFtno73bs
 k6K+63DDq3EoUrsKfCp99rHpE9YQPyfiXDliLC0vItQsyQwAn7xezcBpZJvDssPwbk3et+sxnQX
 dqytjHCMSCVnykqBzVI6HMIImCuhWOrL0D5f/Mmm/0lIlRneuRRxbYTG1edaSutoBzZGeP2z1y0
 WEMm+fYE2jtR5qY+W9be7W5up54SfzhU0RwjjyNza9Y/A==
X-Envelope-To: phone-devel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2bcf0842cc1d433d;
	Sun, 08 Nov 2026 21:04:18 +0000
X-Mizu-Trace-ID: 2bcf0842cc1d433d
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Date: Sun, 08 Nov 2026 14:03:44 -0700
Subject: [PATCH] arm64: dts: qcom: sdm845-lg: Fix dark corner in backlight
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-fix-judyln-backlight-v1-1-af4b946f559f@postmarketos.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MWw5AMBAAryL7bRP1bFxFfFS7WKSkRYi4u8bnJ
 DPzgCfH5KGOHnB0sufVBhBxBHpUdiBkExjSJC2FSCT2fOF0mHux2Ck9LzyMO3aUySLLhaZKQUg
 3R8H7t037vh9m3SnZZgAAAA==
X-Change-ID: 20261108-fix-judyln-backlight-be385341ce7a
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Amir Dahan <system64fumo@tuta.io>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, stable@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, Paul Sajna <sajattack@postmarketos.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794171855; l=1594;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=g4Z6Q6hAGik68KEMEgTB9mU2ims6k+wWZpcxRkDc0lA=;
 b=rCWJIOWSFMq0E2D/zwNxHJ9h5pM653XnhE3C970vtLC6leQX9fU9dvCSZXTnZtFOQXoFblAg2
 AXnSLrvLrDyBI82J6RAX5O2nWbgqPYP7tz5lhsit+Gc/Yms42gMDGhG
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=

From: Amir Dahan <system64fumo@tuta.io>

Restore qcom,num-strings to the default of 4.

Downstream had qcom,led-strings-list = [00 01 02] set, so for upstream
we assumed qcom,num-strings was 3. [1]

However downstream also overrides qcom,num-strings to 4 in the driver [2].

Therefore, the correct value is 4, and that value is already the
default, so we don't need to set it in sdm845-lg-common at all.

[1]: https://github.com/LineageOS/android_kernel_lge_sdm845/blob/lineage-22.2/arch/arm64/boot/dts/lge/sdm845-judy/sdm845-judyln_lao_com/sdm845-judyln_lao_com-panel.dtsi#L29
[2]: https://github.com/LineageOS/android_kernel_lge_sdm845/blob/lineage-22.2/drivers/leds/leds-qpnp-wled.c#L691

Fixes: c6c66aa3ef33 ("arm64: dts: qcom: sdm845-lg-judyln: Add display panel")

Signed-off-by: Amir Dahan <system64fumo@tuta.io>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 84f0e1f0bcd3..e1ecd43cba0f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -538,7 +538,6 @@ &pmi8998_wled {
 	qcom,current-limit-microamp = <20000>;
 	qcom,ovp-millivolt = <29600>;
 	qcom,switching-freq = <800>;
-	qcom,num-strings = <3>;
 	qcom,cabc;
 	status = "okay";
 };

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261108-fix-judyln-backlight-be385341ce7a

Best regards,
-- 
Paul Sajna <sajattack@postmarketos.org>

