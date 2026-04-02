Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB9B355F52
	for <phone-devel@vger.kernel.org>; Thu,  2 Apr 2026 06:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775111944; cv=none; b=tjWL5aUESWVz66wrLRcRN+ANQW4ISLVxtHpABUUCTcXmvCFS3iWQirb3cT8MsyyY1yaSPW1TowiroR2enFCXcRehq/Z/7G20ALlQCHvLwQUd1AB/xLVF8PVEPXGLNTq6S1gfbPBnaSrUyScBx2CFJFSQL3FwWy5PCF1yV61MBNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775111944; c=relaxed/simple;
	bh=qVlujgMOEaY7xi+PNMAVdLKk/YdOHJZXwqfSWM9G4e4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q1dLuEslnRBaUSQJmfXxZkc/sYh9+mpaHnci3qa16XSgyesNrc+9FnHUmanCPKXVfOVSU/rNMYEfkBU3IiI9ajcFYGBDeAk7jve7VFArgGIeLYDCO3AroZsDZ6+XXmrJy99EUuQkl+ZGvR2w9RWbz+Wnn+l5LdlKRqTILwL71oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=lZ2EmA+0; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="lZ2EmA+0"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1775111940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1ErAhS6cOi4C2zWtYwViDGbHHXH/a8ocTkNTwSr/N2g=;
	b=lZ2EmA+0yRxO+oztbx1mTHHWbK9gmhWvLWF7GI/eKQ7297rKLe2SRymCwttE6VuJJU/tiy
	6fIsnWoAI7P1GCfOYtiZ+YVDXsaK0M3qux1bhi0aS/GjL1k9iuJjT4koaisMlXHNUan7q3
	cNBhjpL4rFSQHii+ySO6o006eIihUS8hzez1FFuN/IvRnM9E0rc3nCdNWzrXXePONomjYj
	hVY1JtYGudS0O6SFjvqBnkMDBRCzQqabRiSkdG92LV6iTSrWduSv3apH/cLf+LbvvzhbUm
	RH0u/Q61wyQm70cciyhzuQf29QvYsCVgvTFLdkhdS2NYyArsspWBBtXKNzh8TA==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Wed, 01 Apr 2026 23:38:29 -0700
Subject: [PATCH v8 02/15] arm64: dts: qcom: sdm845-lg-judyln: Add firmware
 nodes, change path
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-judyln-dts-v8-2-7677cfafbc78@postmarketos.org>
References: <20260401-judyln-dts-v8-0-7677cfafbc78@postmarketos.org>
In-Reply-To: <20260401-judyln-dts-v8-0-7677cfafbc78@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Amir Dahan <system64fumo@tuta.io>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775111929; l=1633;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=qVlujgMOEaY7xi+PNMAVdLKk/YdOHJZXwqfSWM9G4e4=;
 b=2Aq+dxMX10SqQHVoRkgT+wq+bVMBKKdIUcmENEwzCMUr1Eny+lmjPSxwsukgFcZJ2gT9YJkvE
 0bWev9saiM2A3Il6CYuGNkJAM2liAJLoW6s/vDHgTt4K8C0/UE8Hi+Y
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

Add paths for Qualcomm firmware, including:
ipa, modem, venus, gpu

GPU and bluetooth are confirmed working, others may need more
testing/fixes

But regardless they will need the firmware paths specified here
and firmware added upstream before they will work, so might as well
get started on it now.

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
index 09bfcef42402..6d6cc197176c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -40,19 +40,23 @@ key-thinq {
 };
 
 &adsp_pas {
-	firmware-name = "qcom/sdm845/judyln/adsp.mbn";
+	firmware-name = "qcom/sdm845/LG/judyln/adsp.mbn";
 };
 
 &cdsp_pas {
-	firmware-name = "qcom/sdm845/judyln/cdsp.mbn";
+	firmware-name = "qcom/sdm845/LG/judyln/cdsp.mbn";
 };
 
 &gpu_zap_shader {
-	firmware-name = "qcom/sdm845/judyln/a630_zap.mbn";
+	firmware-name = "qcom/sdm845/LG/judyln/a630_zap.mbn";
+};
+
+&ipa {
+	firmware-name = "qcom/sdm845/LG/judyln/ipa_fws.mbn";
 };
 
 &mss_pil {
-	firmware-name = "qcom/sdm845/judyln/mba.mbn", "qcom/sdm845/judyln/modem.mbn";
+	firmware-name = "qcom/sdm845/LG/judyln/mba.mbn", "qcom/sdm845/LG/judyln/modem.mbn";
 };
 
 &tlmm {
@@ -64,3 +68,7 @@ thinq_key_default: thinq-key-default-state {
 		bias-pull-up;
 	};
 };
+
+&venus {
+	firmware-name = "qcom/sdm845/LG/judyln/venus.mbn";
+};

-- 
2.53.0

