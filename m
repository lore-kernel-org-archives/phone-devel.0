Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.245.251.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795165188;
	b=CwqJCzQ1QlM2HVpMNRaY9zD3B/xRSZP267J4q5Jg/BeK/IN+2snf2xUePe5TCW1WIXV5
	 wwKUnfgSthE/hkY8/qNp7m6cPHoc0of/J7AOac2g9h9drO3KixTHnNuEhGQpDjsPgbjj+
	 VQF8kHjDSNg0CREC4T1uJ6G0boHKnDIe/GAqgEPOVxyWBlJsaT6ykk/EBDuQrGjXacPNl
	 ibWZ5A52UqKgdoduVmp7mDEe7M7Pf+KkbKG1skAd/GIu5VspNZD9x+a8Ccfc/wbMaqQUk
	 dedNiQREL6cvkTZwMIbtAGH2Plh3RxKGlbd08y9nO96cc296eD8FU6UYi7uLAGYuU2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165188;
	h=DMARC-Filter:From:DKIM-Signature:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=fbQvGbxMmP9kcDTrgeOTvwfYbL2AhH5t1IgaPsWtq58=;
	b=Hmk5T4bgJphXU6uc7leh0l5tRUFfyM5xmJHUlCjI6rChWaqFy4byI6/a9vQ4SkZoFhyn
	 Nllh5aWO3uPRibEvj8FxTpbdp0qTzk9s5f02qXoGn411fnaXD9XNSciEG5sWyAZWCOv0y
	 OWQqepDYREXmXEZx0whGq1HCoe7d68Wh6QnQDMD0oS+IY/R3GJ0P3y+PNgWa3DwLap3AZ
	 DZPc5Z6owOscdxE7+c5SO2xkAcIGKu07oL94KCsTuDmTFnLFA/WIt9oCBQA0s0Q4En0Np
	 Ri41f6JosBBsI6qLU6cSuoYdZGLYIMBfUb2V+j6uHRK876kJ4afeIZAaacadPEBRWEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fhannenheim.net;
	spf=pass smtp.mailfrom=fhannenheim.net;
	dkim=pass header.d=fhannenheim.net header.i=@fhannenheim.net header.a=rsa-sha256 header.s=mail header.b=Eabu1trd;
	arc=none smtp.remote-ip=188.245.251.181
Received: from mail.fhannenheim.net (mail.fhannenheim.net [188.245.251.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84E3606A32A;
	Fri, 20 Nov 2026 08:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A84E3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=fhannenheim.net header.i=@fhannenheim.net header.a=rsa-sha256 header.s=mail header.b=Eabu1trd
From: Frieder Hannenheim <git@fhannenheim.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fhannenheim.net;
	s=mail; t=1795165179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fbQvGbxMmP9kcDTrgeOTvwfYbL2AhH5t1IgaPsWtq58=;
	b=Eabu1trdySfLItNplIMy+zLULvCstrcaTdKkErkN0nXhGTSEQAOn7iESJlkssHhKOfjHAK
	g/ZTYLzqb/Qb451Ly0VqCrfo4kuCV+KEJNiqGhxO4/bvahKmmy8T6NaLMdbXCt0ZsDo0PK
	Y5BFU3OmLbQevergWr58TnMZlp04pvY=
Date: Fri, 20 Nov 2026 09:58:21 +0100
Subject: [PATCH v6 1/3] dt-bindings: arm: qcom: Document OnePlus 8T
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
Message-Id: <20261120-kebab_dts-v6-1-b7ec55f3d04f@fhannenheim.net>
References: <20261120-kebab_dts-v6-0-b7ec55f3d04f@fhannenheim.net>
In-Reply-To: <20261120-kebab_dts-v6-0-b7ec55f3d04f@fhannenheim.net>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>, 
 Casey Connonly <casey.connolly@linaro.org>, 
 =?utf-8?q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>, 
 phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Frieder Hannenheim <git@fhannenheim.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=744; i=git@fhannenheim.net;
 h=from:subject:message-id; bh=CeBRjPUFvwQTFpQjuReNKg163gglm/vs4m/E4rGk7Bo=;
 b=owGbwMvMwCWWw1h8YvtkuWDG02pJDNkM3K/u+bz6musmLmCcOa2piINB59o0Ew9jPYYfD914l
 Xbcjl7XUcrCIMbFICumyOI8XfKHfaWwjn74P0WYOaxMIEMYuDgFYCJpPxn+B2998N621aepastC
 4XUMdryR38K+cbnk8G2y6C5wMX1fwchweMFizsgwlSOr9l74rZDzjO9P3wxZ05rXcWZV0keDdD9
 zAwA=
X-Developer-Key: i=git@fhannenheim.net; a=openpgp;
 fpr=439719F83F79132C2F57FE216C0173C8B7931E53

Add compatible for OnePlus 8T

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..c21ef16e9ac8 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1067,6 +1067,7 @@ properties:
 
       - items:
           - enum:
+              - oneplus,kebab
               - qcom,qrb5165-rb5
               - qcom,sm8250-hdk
               - qcom,sm8250-mtp

-- 
2.54.0

