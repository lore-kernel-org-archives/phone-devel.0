Received: from mail-244102.protonmail.ch (mail-244102.protonmail.ch [109.224.244.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D895FDA7
	for <phone-devel@vger.kernel.org>; Tue, 14 Apr 2026 18:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776192667; cv=none; b=iAl+E2rMS4zW6uwJvwK1R/trYXXBem0hev+0515cpF8q0j5DmTB7qgjJDkqoKEmYDgRmt3d93Z1kDNoIK9zLE4MlK+ZfxYb5EAdnkChSSLV72vbrX3+YNQbDpN/HfR1ZQXND+Zc9qWoytkUeeBA1RGQYc/7r1GgLsjaivQeC62s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776192667; c=relaxed/simple;
	bh=sWII8cr0IDrUaVYwsXqXw7SpXWjWkLWEAJ4fRFkC4ro=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VaIFJlSOWMvbHeHWuAA3hAIeS5k1PP1QyxpyD9yQsYAaUNnpQYQxkAY245ZzXfzhDQTupyIM3aO3pW4DUezRaLKEbuQOTVUo3A0tJvGLwa19qblGaHlg9BeHB903El9hTvcbT3pIOQ8DD9o59Tr1YuPdma+Zhq9o+2aBb+5SWpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=fSgYten4; arc=none smtp.client-ip=109.224.244.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="fSgYten4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1776192293; x=1776451493;
	bh=RPv01d6C/MbKERrOROHXkW+VpTGkkwfcaIq5UB65JK4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=fSgYten4taoVD46RbSoytWXilBnCPMyj60TeXCPipvztllt9AG46CsWhmRfveYsLw
	 ASCJ0cTflERzKSMefY5kZHpIufmfYbjxFd40Aq22RFcDo9l00DTAb9rQ5yH2v6SiIW
	 zBhuvLPAcRjPCncRSErgzLipcWGY0LNDOnjvUpNKhfw0mNY2a/Pv80p8HaxxQMPrOn
	 dfThnbslnKsSxkyoqc3msyO7g56sYlnvNFiRVDRWcIcRIBnaHqeuKVQPAX+G7o0Yg8
	 9jYNI6jhS/ZQj0pS7o+VWl7+p5Lj11CdmCT2DCai/NQ8GfoiCd0EgYwwfPhBDcD594
	 KnwMWTJpuDg6g==
Date: Tue, 14 Apr 2026 18:44:48 +0000
To: linux-kernel@vger.kernel.org
From: "Lin, Meng-Bo" <linmengbo06890@proton.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, "Lin, Meng-Bo" <linmengbo06890@proton.me>
Subject: [PATCH 1/2] dt-bindings: qcom: Document panasonic,eluga-u2
Message-ID: <20260414184429.168612-2-linmengbo06890@proton.me>
In-Reply-To: <20260414184429.168612-1-linmengbo06890@proton.me>
References: <20260414184429.168612-1-linmengbo06890@proton.me>
Feedback-ID: 112742687:user:proton
X-Pm-Message-ID: 844101344c4a9a4f6f333ccb3284edadcab56712
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Document the new panasonic,eluga-u2 device tree bindings used in
msm8916-panasonic-eluga-u2.

Signed-off-by: "Lin, Meng-Bo" <linmengbo06890@proton.me>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentatio=
n/devicetree/bindings/arm/qcom.yaml
index 1335a7bee397..5b60145c80e7 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -183,6 +183,7 @@ properties:
               - motorola,harpia
               - motorola,osprey
               - motorola,surnia
+              - panasonic,eluga-u2
               - qcom,msm8916-mtp
               - samsung,a3u-eur
               - samsung,a5u-eur
--=20
2.47.3


