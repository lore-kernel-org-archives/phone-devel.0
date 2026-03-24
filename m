Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8062A381AE2
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 02:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774318071; cv=none; b=IMz39AqANaKC9qaudbBsAlmKbI+2XD+MAgcUQMbaM06AkY8i7zjMW3vscq7tW6ZUM1asriVG/48oUDzYYyF6PDUGy41QijeXg24NUCszaOMPs46EFuHHdR21unKpXZKFt0lfx9TbC7SEx2fZDH5Ch9Iichv5OwG7EvQqz3cG3No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774318071; c=relaxed/simple;
	bh=6sndJc0GBJQmB9Do3SK54gedFQw9+lX80iibDDxFoFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T67NxWRlajJsGl8cLYH5xJ0un9yZs5qeJ69wXAb4QE1ybwFhatz/vK3I4UVeo7xxnYgJkiSefAUBrd1r/P1MXxBQQgFhOvpUn+oiwbs+0IbSDKzEAH9EhyH7fDcXOJ0k1nAMtypS45V+2FUeCS/n9GMb3ADwnqz/XB2IBhBhPqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=nTl6i4/C; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="nTl6i4/C"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1774318067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YHq+H6MH4LbASJLjMcjCQqRRO4xEm/zZrOQ3FUn7dvc=;
	b=nTl6i4/CzEDqO4S08SPO7fruV6VKSHfaRofFzvio/3XPplsFZR0p+VYDWWkXovguheH7V6
	PcQCLovk6udEDfcTuIJO28T5EKc2jm4Qlf5YHLfCW16gqVxQii+WfqaEDRVQk9C4nUYYHe
	hy4jszrIlp/OZiH9M6qfqLoYOgUNPYVNaorcqsMV6AkrYfCEPhEmaxCXN0T7hA1fWPWKb5
	HBeddbVnG6UGP2m80buDXY3qUece0rp7OwsKJHvY+zjsBjfTRtRInhhY/or2onp2zSn3Co
	rM4Kr7MB1BLuamFfWdZStS13h/oS1Hz//Yms7pay23jemZvmSb8f+UtyQtbtXg==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Mon, 23 Mar 2026 19:06:32 -0700
Subject: [PATCH v6 02/15] arm64: dts: qcom: sdm845-lg-common: Enable venus
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-judyln-dts-v6-2-29d70ca1651c@postmarketos.org>
References: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
In-Reply-To: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Amir Dahan <system64fumo@tuta.io>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774318055; l=563;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=6sndJc0GBJQmB9Do3SK54gedFQw9+lX80iibDDxFoFc=;
 b=5N1Q50wJ7bNWmZyC8eXo8k+88v00vaQvHzvSvv4kehGKjBj89+D8Ws6q7nfa9iMgs9zyY/tcP
 BoTeoS3zzDcCRQupqALtRxxwktr7iiWo9dkvC8TA/XSDfgPKvLXvCeZ
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

Qualcomm video en/de-coder

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 93ed8f240461..87ac41ec2e46 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -580,3 +580,7 @@ &usb_1_qmpphy {
 
 	status = "okay";
 };
+
+&venus {
+	status = "okay";
+};

-- 
2.53.0

