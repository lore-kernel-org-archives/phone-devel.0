Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C386D258EE1;
	Thu,  9 Apr 2026 02:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775702542; cv=none; b=JeC1A2JgC84Ri3fl7tOkybCXw82HS4t1mbRbn4rdWJj9s1/pPA/1I4HqOn1sb5o4ZjpT7daCUgXXRWO4FDeOKAB/Abpah3O0XAlF02C3G1amhuUdGTskeRq04D8VdBbNV21QSH34JFkLY76YwGsRSo0lUNoTHBLaB+idIlzRdsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775702542; c=relaxed/simple;
	bh=sqb2CwDa1Cq0XxXDMv1rUhOVD7diLDVG83sABn513b8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bb69xIlPpRuXKo1v+GTURRWLzuOnwmUMdO1xoGxgcow5GO9GljmxJdgqCSn+y4JD2MCjdS8UX/hQajRxgmvpL+/5Sxz0zHR1fSiYRb18wLohuHqlkUQ8Bz60fXOwNqDXGyNMTG/kn/0y9x37rlwgA8N97rgMqI6LiIvSu3/Imco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=b/OoYyzu; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="b/OoYyzu"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1775702539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c4vft3JoOWNIiyb6XKVwI3B9R+MjrgmBnquYhO1fWhg=;
	b=b/OoYyzuc7a9rPbMDKRtohqieZw/YG1+VStkpmV9VRI44IMFhxtgGSXY0V09dughuBnm6C
	mOFqtse5XZztN4KqHuvzcVQaMjlpXh7OUsb+wr4V+jN0kqX4J+NtVvpbgGtD/SLuqFgd5q
	7NL58cX55q+e7GnY/Z4RztuY1Ew4CNk74jJr+19vql+YoFyuz8Gd8EnD/+qaP1D0y7sN81
	Cr4+1hpncRV8JRvejDCN3n9zSQK2dPvDhpu8INYGHrkGCv3IYmzJ8lDs9wLo4F2SROBKvf
	76f5fLSA73QnhHjTbxQgqBaNTZwrIguotm8JPOEOcG0lhAVrazCGFhrxNOFQzQ==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Wed, 08 Apr 2026 19:41:13 -0700
Subject: [PATCH 2/4] arm64: dts: qcom: sdm845-lg-common: Change ipa
 gsi-loader to 'self', add memory-region
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-judyln-followup-v1-2-823467519b59@postmarketos.org>
References: <20260408-judyln-followup-v1-0-823467519b59@postmarketos.org>
In-Reply-To: <20260408-judyln-followup-v1-0-823467519b59@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775702528; l=1064;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=sqb2CwDa1Cq0XxXDMv1rUhOVD7diLDVG83sABn513b8=;
 b=4qgYHp3X0iqCOX1EAvidijoFkGMZ/+/ZE3Zg7y7oY/Po4VxghjhQ4ld2rLRo65+VhIzC/1K92
 TIk7VjaMF1EDVCsjDIiY9QMjzphcRoUeJH5BS+3Mvt4nmv6O2rBAI4l
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

The modem firmware for this device doesn't preload the IPA firmware
and requires the OS handles that instead. Set qcom,gsi-loader = "self"
to reflect that.

Ensure the ipa uses the correct memory.

ipa 1e40000.ipa: channel 4 limited to 256 TREs
ipa 1e40000.ipa: IPA driver initialized
ipa 1e40000.ipa: received modem starting event
ipa 1e40000.ipa: received modem running event

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 9d82961d527e..85dc4468b6c4 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -473,7 +473,9 @@ &gpu {
 };
 
 &ipa {
-	qcom,gsi-loader = "modem";
+	qcom,gsi-loader = "self";
+	memory-region = <&ipa_fw_mem>;
+
 	status = "okay";
 };
 

-- 
2.53.0

