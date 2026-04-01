Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD4D382F29
	for <phone-devel@vger.kernel.org>; Wed,  1 Apr 2026 03:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775013781; cv=none; b=eMRbAtcB8r2dRYX+gP+vPQfQ5xJ92XVs/2jiHh0CV3gOx8/XrCO6OkgzsyNTmyXLkVZ82VFPflSQzSR0zIBc/RTSgpvjhP970Lm/lNSH8k8QkZl/HyNFBFro9ysXP19PVcMBY/gJSn0oVwZdB69d9SZ9VSB1j4SEGr26mQJNjK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775013781; c=relaxed/simple;
	bh=sqb2CwDa1Cq0XxXDMv1rUhOVD7diLDVG83sABn513b8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MQaehKxVId6LpJQSOtldNrO5Kg0DTB9PhnWOEqfNx9uaWHxqDC1oxM27fOonCyeHYdgaeTU+4q2rTx/7mPyk8RUrgnZFUCa9EgpWFUmlTQlgGJcQPceskgTb2EUZnmQdEhqYv2Nec34qCNApXzNHBVCngQ/LD1VFMHqa2BJfMKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=ahtprGhB; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="ahtprGhB"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1775013777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c4vft3JoOWNIiyb6XKVwI3B9R+MjrgmBnquYhO1fWhg=;
	b=ahtprGhBvX7Ga/7uIPN0MK0QL+s+gxTxCty2sMWO4g4o2p8XsBoGYkyZIoYXZL67rPXpMB
	xDII5Npb3hythdP0ziHNkAXlN9K8GOKtHfy/Y11pxIizxflNmdAgSgR1hI0sfNDfnjgYSX
	e3ZyBNpl4dk58uVwQE3YKp7wYVqFf7e1aVOYUnJzGdq1OSfxnglRN1HkeZ8HCG3/M5/9yM
	95EtpEEFo1dqb46nohVL5ZDShHYq7AYUuP/28vqTS+DpkugMaPI98m8DP0hhvZpNxFU5M2
	7gDbzAR5Yrdt53hK2GRsHmczo+LzQQYKgPDzUZeHnQKU2YVlgSQu9iIjl0PaNw==
From: Paul Sajna <sajattack@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Heidelberg <david@ixit.cz>
Cc: Paul Sajna <sajattack@postmarketos.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Amir Dahan <system64fumo@tuta.io>,
	Christopher Brown <crispybrown@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v7 14/15] arm64: dts: qcom: sdm845-lg-common: Change ipa gsi-loader to 'self', add memory-region
Date: Tue, 31 Mar 2026 20:22:48 -0700
Message-ID: <20260331-judyln-dts-v7-14-fbbc4b7cc557@postmarketos.org>
In-Reply-To: <20260331-judyln-dts-v7-0-fbbc4b7cc557@postmarketos.org>
References: <20260331-judyln-dts-v7-0-fbbc4b7cc557@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775013472; l=1064; i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id; bh=sqb2CwDa1Cq0XxXDMv1rUhOVD7diLDVG83sABn513b8=; b=xzJ6MPqVyGZqvTXrpJq6vi7OFA6m3O1bNd1VH4EYQGx+/M2i4FeSuQrmo1bz0wfZXkcEoizY0 puUz7pL5eZCCOZKf8rEp7cF6Yv+4GhbOzGf1NWwJszIlgfH59uqIBap
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519; pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
Content-Transfer-Encoding: 8bit
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

