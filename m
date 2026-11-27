Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795804781;
	b=hLeCpo+YSOa9UWaal61n82PUqCRANhSZcxn01j47IJDX686EDvYgJt4v/Ca17ZeflVzu
	 1G0LW9I47STtSCPHL68UjcV8Z7CFwFxSrvI66/TNGaKMVAarM6H83JKC+ybAn/er+j3cL
	 R1PCRN2lAJMFCgZEy67FFxUbEzZBAzzsGO3IDxrErEJNCVdE7uNOT17gnrHRXLofQmqk+
	 +m0xzQVJEgrpUkA6TPooJ2nk0Wh0RlSSlp5nIGktK7laImfw0cGtNMJL1OXWiM13sk/2g
	 6JAbgXmwR9NR+RGKHKzWagbGi1RVE33I33H4HUdfUlWD+wATPyOE+QEv9mv9QzSxZvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804781;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FXJgBz6vr8LA6HCfds0NKQOzIPEzeSxi9JM33PT64AE=;
	b=WFYwfshK/5+c7Nns2N/qCBvxUk9aj1jxg2Kn8Gfcr0RlKriQxJQlUq3fpOgcVt+nj/X7
	 J5x6Ud6xet60MXYWA3K+spsc+DSHS9kOgbQDE3P4MonsC/+QOu8W4KoUdXQEU+bwznkKP
	 j8fVsm7fwiuUO6rtUN/KiMYIEYq78pdxfnYxKxIwg8wIc2NKAgUhhcnvSpHZys7SGGaHU
	 BTabD2nqim1JihP+YZ21LI7qdST/qs1qk360ZFyslng5k9HDgfFH5A7pFnUbdmkki/ODC
	 6aQNlCwGrBUTMK81Y1nzT8+IH8QwHHZToOqZ9ldzJT4IeEk/Vls4Ungi1OWK6XEcUTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="MQ/xnAvm";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5422F60A261B;
	Fri, 27 Nov 2026 18:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MQ/xnAvm
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795804780;
	b=YOE5Z7Capv+3+pKr0xu1wBB5F+oKkGCtecoe5UBdqjbN68NF4BX4mj5sFAV0FaDfQ9pP
	 Qb9/ZWejrt2vNINNpjec9SNdGzgFl5c2YhY5QSmhZOshGNVZtDAvOaAp7NS3p6Acdk5xe
	 wvusO/ooyVw9GLPhmB+3alkAdKDqe3BSqu5T3Jn4zm9Joi7tDMVeZG7u/n/psaRIfNfWV
	 5Mg8zLpeCeoyRuEq0MDQnJR0Lx7Hs7YJOFGxgjtGO56IbY1go/mkCFVG3CHc/G9QFUw+M
	 UfI0S+uf87jiCP4nuiCPUUJzre/5jgMb5h8uadulq1duRQAugI9vkxdsjcmh+E7oJBQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795804780;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FXJgBz6vr8LA6HCfds0NKQOzIPEzeSxi9JM33PT64AE=;
	b=N0+WMnuls31H2fTbOcYr6dy4b+TtHdZQE1eeZP7B2tl8WhGQmH55ZRaLdb73wBpTuPsb
	 ss60y9Xg7qVpco1Mn+WSVjle7WEM9qv8+vaOAnEgBjCKRUAky6JQ4+WtF9h+nup96KRaZ
	 7sjlgPbI9MiFxjwIkq8IPacrEY6ic2QWnfxHNSHtTg3znIUXESYSHexaPsLqM9gDvwLmK
	 t0NgP+bbf35xbOwEh/yEKrz2P7Wqf55WaXoGFv2PNXSNmU7iopr7OQO52/ek6Lt70wcKb
	 3pKGbuwDS2tHxKn79Mu39yXpnFFkAFPYV/ncdX0tPgjNP6I8g2y6DsOwVR1TqpDNpQw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AE8D81F00934;
	Fri, 27 Nov 2026 18:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795804780;
	bh=FXJgBz6vr8LA6HCfds0NKQOzIPEzeSxi9JM33PT64AE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=MQ/xnAvmipTfp9WyZdSAT1tn2h20rG7j4i2JHXxKQufDqeW3O5gdhuTxoxK7NrI8G
	 5QV325mYRuivlXhVhltGac/BnkMFleaeuiHEm61XXU/GteRP4DX3umelNEuHL8jIv0
	 3Lmme9xDbEl1ETT4TVXL99Hv8MqUxMiaSpCvQtRFhfClgarFsS606IHVxS9Fsqcpou
	 ZKiGCsStS4li64kkHQLlcvcoAoojHEqbgaQNld/qhL5tpiXcn9MdpaBVJ9hMoY0Ml/
	 zzITSFFMkUcisgm3kvnXnkiJI70amqPItm6hYtvR5fpTcfF1lpCImvSUrLYHzaGvAo
	 ji72LuqGO2Nxg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 32F6C4DD3F;
	Fri, 27 Nov 2026 18:39:25 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Sat, 28 Nov 2026 00:09:26 +0530
Subject: [PATCH v5 06/11] dt-bindings: arm: qcom-soc: Extend pattern for
 Molokai
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
Message-Id: <20261128-molokai-soc-v5-6-144801dfad7f@yahoo.com>
References: <20261128-molokai-soc-v5-0-144801dfad7f@yahoo.com>
In-Reply-To: <20261128-molokai-soc-v5-0-144801dfad7f@yahoo.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Venkat Yadlapati <venkat.yadlapati@yahoo.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795804762; l=1622;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=VD14FFXSRlsFBCtWWzPO6qLJHtCRQHevg44GIXEHArA=;
 b=WgYtBEiVtzvFzYpcoQCo6Fpe4eROg83KoRoGdfJXX3aeN8JF4R6YIMfUbqs6LAHk6Ck7qpAgf
 m/hd1r8BQvdABQ1/qOaUmDXmOivLeCfRRvEi37e+o5ugg/mAGhNkuau
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

Add the Molokai (SM8845) codename to the patterns of SoC compatibles.

Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index 179aadc86a9f..19904e5bc947 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -30,7 +30,7 @@ select:
       contains:
         oneOf:
           - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-          - pattern: "^qcom,.*(eliza|kaanapali|kuno|glymur|hawi|mahua|maili|milos|nord|shikra).*$"
+          - pattern: "^qcom,.*(eliza|kaanapali|kuno|glymur|hawi|mahua|maili|milos|molokai|nord|shikra).*$"
   required:
     - compatible
 
@@ -42,7 +42,7 @@ properties:
         - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$"
         - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
         - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
-        - pattern: "^qcom,(eliza|kaanapali|kuno|glymur|hawi|mahua|maili|milos|nord|shikra)-.+$"
+        - pattern: "^qcom,(eliza|kaanapali|kuno|glymur|hawi|mahua|maili|milos|molokai|nord|shikra)-.+$"
 
         # Legacy namings - variations of existing patterns/compatibles are OK,
         # but do not add completely new entries to these:

-- 
2.56.1


