Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795190007;
	b=h+NezAatspNYhlg9F4qRnINnLvFTdhNaef9rJwMMlgF4EIMuX80liUMqy5eyjOpQ0l5b
	 8hEO/TCZ6WsxYUtKRL/fSpfxPxnjvsbmBzRGJfss+NarVmnUF5hlUxWtGO64w01K+0+EV
	 wB9MN7mVyea1BNgnLZ2atjsWtR5GI38p+jk4WrZzwsKLQW8uQC3ASAJ+PepNeUmLIbJbb
	 IIAeBHWkuQaPmYr+Th1vCYLQsUhQoumQNKRnOQcZAt1HA9juKjt6toj0Zk26drf4J77O9
	 lGtdvGT8yaidTIQPhonJGgoDAyxxTBUb2PnG4ZVTn9rFZ4iUq4zzg1RB8B+jwapWsbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190007;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=CT/fF1UoEqKVGfGJyK2s0aO3X9xaluCRgBRgqm42P5Q=;
	b=5YhoQj7n5KXG4eZupB4IqNlhQfSp6OSiTzZmLCVBl73tHT8yT3ms5N4mL28BBMVw493p
	 RRx73FDyLHOLUi52RiHihK/TEnYzc1jqqLPM5ycj/5GC58bExNotDDG/hedNvk27bpDbd
	 GA1JP657r1WRj0op68zudzMKjnKt/jXrrO5diLcWCqYZRX8+k03WhJkxPDPjwuvwfdSzO
	 lUxd1zD+Gl2LyRL31gfiRnzzNig9+y4wy7gnx2rm1bKylzxjPQSOK7w8Hq8OnRt6Y0tzm
	 QmGzT9XWNA1a7hDKFNF8r5uDeIIMEk/EyJN33fEJIBcQZ6iHTGJ+5kSku5bkTVkiCSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iYB19sj0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F884606A33B;
	Fri, 20 Nov 2026 15:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iYB19sj0
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795190007;
	b=bxhVde0d1Efes9j/DK+osmC3SlhCbszy3iWjpDlEMvZd9Gy+6y0engfFtXi0civJxVlZ
	 KgSWMZgVhOelWoDhU8gPf+eqKUUkJq8lxeucldDNw3hDnqfuCq7GlcWlxzxWxq9Tl1iyu
	 dOPgNxBhg7dv9+WRgllGUI/Jlcwu7WA5fbkBn+DQEql8DLK4ghq9oW3KF4Yvrwzz2P7kY
	 O/LI15tLERPRogPkrr03lkJjYDGrA1FJIP6SfPVpfpsshcMAY/Y1IPIRm5MyR0HIFgYoY
	 u0+buKJox86TfzaR1mpSSo/qR9D/ivZXuuRysBo6zMg3xD3F8i4pWvEDgNDxGq7snsA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795190007;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=CT/fF1UoEqKVGfGJyK2s0aO3X9xaluCRgBRgqm42P5Q=;
	b=HTKgG3tuqfcJhFzdiSFpXFVqDMW7YCWv7D2GAb4dnv8V63+hIbzyZSQREkTMfRTa9+hX
	 1DTwvTJrtoa3vKtDMN4adu4qbteB7zF9f/lbzJhaYEWgt9ChE9/h3ipbjhb09Pj6kdCwJ
	 nFoOzhqngIA1/rk+8vvVfdND2BNKMBThav9X7NBCZCsdSeXH9EScjSciPG4Gj542s9t7D
	 50GtVf/tVmlELFxG/QYc7N7ha4zD2fksRb/QwOZPPACoKs9KRyGDbPO+Gf9BmcHYEdulL
	 Fx0cGesZYuaztED9P7yykn1PXu1mMWJd1Dysiu+7ADM8cPUTXmnSDMqOeLVi0sltwwA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F01781F0089F;
	Fri, 20 Nov 2026 15:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795190006;
	bh=CT/fF1UoEqKVGfGJyK2s0aO3X9xaluCRgBRgqm42P5Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=iYB19sj0ZrMA9iOTfeKWW7hOhD3c90XyoedeVLmmbb3pl0AVD+/hTsP2vf7wevO4Q
	 JJZMIOePYJatzLwRywkz2sjZSDd/xaNIBACpsx4Vg02NTsNOilYHKADWls7txnQBx7
	 Tpnyx5e0OiTAT5PtFcFd87jqe/cNM7f6TH0K+jG8elE7BigDJFjJ2PxnsTQ4n8a2PD
	 zNkFLoSq5be9426O8Nl48YGkInGjVhyirATIU4/O2sA63AQItH2c1sdyTreOLeRt4h
	 DXIAlT2MWw7DW4knfPmFnZenHVU38tihPmdbOqj1UkoCbBppyh3zawLRTAh7GK8oFP
	 bWXaX0tJs1mRA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 340A94993E;
	Fri, 20 Nov 2026 15:53:05 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Fri, 20 Nov 2026 21:23:08 +0530
Subject: [PATCH v3 06/11] dt-bindings: arm: qcom-soc: Extend pattern for
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
Message-Id: <20261120-molokai-soc-v3-6-403d763685d9@yahoo.com>
References: <20261120-molokai-soc-v3-0-403d763685d9@yahoo.com>
In-Reply-To: <20261120-molokai-soc-v3-0-403d763685d9@yahoo.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795189983; l=1549;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=IOps304WyGHGJezdclLWJUhOm2i7s1yAExaRB/uNhBA=;
 b=NpItC+AjSY1Sg6DcN1tz8SqSL4x2x+5mu6vyeME4c31Qt6UtAJYwtxXz4VpfQm47+iJum6hqm
 HSLwodIvUlgD6EQdQpRCIprASLJhmI/oCnAP7+OFJA5PfyopXwrSFBA
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


