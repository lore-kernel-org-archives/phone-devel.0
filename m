Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794441242;
	b=0jKzAtQiqaCX/Vd2C6ryPQsru2p0N4jybfGLsi0PYfWmC7ex2+UHTu+evfH5yVD/PX9+
	 5aK7050fUYs3UoyR3HefiTBcYM63aszmkmSTiHeTBGR1gavYTeD7xRPT8aDR2ZkDjmC80
	 E4Negyvc1jEFFaiSsbULadmHbBUPx3LWtKxw4y4dHvhqCjp8atZ9PabTWf/SK+t6WWNmP
	 po7YFK0bt/DtuNDATR2RhKdyDoJ7W65zKR7Bh59rJU2eoWeWbIfF70bpWvU0LtVY+uSdG
	 +l8tTWEq5WzxLRO8dUhpfQ5EoiMTMgp5D/FB1JmU3aGdmj4XvJg+D+LbMKXOdsNJbBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794441242;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=87cjur00E5X3W55oKhkJKGbBj84maKnMOGWtMkcOS4o=;
	b=UKX4NVxogVvGBINSiIK5g7NJEp61n5XComaWL068t7vkzoVvAh30wMBS4eGe/GynPiTS
	 9LGI4FCc8Npzape7BAfQlQueF9IPoKNLPyrqWkWJsx4AL6HsCO6lpxSJ9DiiJf6SZ4uij
	 KKWj9+n75IncgTP4QXzfoXSyyj01yYiJAWUKTfIvCRao+4iQBFUzsIxhQiO7DT/D+IFt5
	 Rx2/uXeT+QHy7B1uMrsiu6i5He4MssY1wUqHiDYuM7kplUo5S7fgPoGSFk+YCUbj2xpVJ
	 6sfPHDbPY21ZstHlLHi02u9/p+RL4AdHIxq4Yd0Zun0EqufV9l9aXMcxUt9JSQ0jDbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=postmarketos.org;
	spf=pass smtp.mailfrom=postmarketos.org;
	dkim=pass header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=MFIMZRdy;
	arc=none smtp.remote-ip=95.215.58.17
Received: from mta1.migadu.com (out-17.mta1.migadu.com [95.215.58.17])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640AE606A330
	for <phone-devel@vger.kernel.org>; Wed, 11 Nov 2026 23:54:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 640AE606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=MFIMZRdy
X-Envelope-To: phone-devel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=V3cehZEUOP5ybTF1yl7Sucyl3THFXUu4zKLkQP68yVk=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794441239; v=1; x=1795046039;
 b=MFIMZRdywKCI6l0qgNg7CrqHrpd1JO14Odr6OWuKiMpdI11ARFy1q2E0fIDPpmVZd2ovCpAo
 +deM9n4gDfu8wcJ2TDg6Aefp/7x5dg7QS7oXWIgfB9YByn7lAHYnTN3c9R/lZXYgsuEAqpzJSkt
 XOo2G0hrlF+Q99DzRQ3V2BH9SRGJ7L1Hjkjvud+NjKzd/mjTDdf29DYYny0+XcrU2wvMD3urQOR
 CdDhMkgitpYFEZgvSc1bno5fmI8O0caLnl0qQ6/sUkf4qM5ecyqpM/Yp6rkKlpoQc22WjkoYAZI
 uCxIPBg1gxOPShMdkmqtHcnhDsVHPc0bVnTGVLA5fKCPg==
X-Envelope-To: phone-devel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 309c136bc5822c4b;
	Wed, 11 Nov 2026 23:53:59 +0000
X-Mizu-Trace-ID: 309c136bc5822c4b
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Date: Wed, 11 Nov 2026 16:53:46 -0700
Subject: [PATCH] arm64: dts: qcom: sdm845-lg-judyln: Drop qcom,te-source
 property
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
Message-Id: <20261111-judyln-panel-glitch-fix-v1-1-ecee1f0a1b30@postmarketos.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2M0QpAQBBFf0XzbMoQyq/IA7uD0ba0i0j+3eS8n
 VP3PhA5CEdokgcCnxJl9SqUJmDm3k+MYtUhz/KKFFwOezuPW+/Z4eRkNzOOciHVFWUDUUmFAV1
 vgTX/z233vh9L40R8aQAAAA==
X-Change-ID: 20261111-judyln-panel-glitch-fix-17610b11513c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Amir Dahan <system64fumo@tuta.io>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 David Heidelberg <david@ixit.cz>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794441235; l=960;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=V3cehZEUOP5ybTF1yl7Sucyl3THFXUu4zKLkQP68yVk=;
 b=tp2/BeRNN4TEd6J9sKaOCcnJ3bw9h2fG4R7tvxJ5zcB0Hg9+KlfKB89nEHOTab99vZ4dJDSyL
 lmP5FH9qRWxBxWknBvPcxnU53S+jCZqsaNOpOMQq4Pq8o/U8hihjxjx
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=

It was introduced without proper verification, and causes
graphical glitches on the display. Discovered by bisecting.

Fixes: c6c66aa3ef33 ("arm64: dts: qcom: sdm845-lg-judyln: Add display panel")

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
index 349faa123ff1..e54e46a1a6dd 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -111,7 +111,6 @@ &mdss_dsi0_phy {
 &mdss_dsi0_out {
 	data-lanes = <0 1 2 3>;
 	remote-endpoint = <&panel_in>;
-	qcom,te-source = "mdp_vsync_e";
 };
 
 &ibb {

---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20261111-judyln-panel-glitch-fix-17610b11513c

Best regards,
-- 
Paul Sajna <sajattack@postmarketos.org>

