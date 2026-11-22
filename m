Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795374487;
	b=FI+XKY2kpZlZbCnFyZdrVHt6kKbTHepa7WLDktbeURG60CMx5NCU67ghhUJMqxgr15vr
	 3S7QIAtKeRcBWcuMZGTVh6XbG/90ZTZqmTz7EzgFNH0o7bvjo36kTuv4LVm9LM233KtjU
	 GlAg/lIb5trjSPMwy2svAIQoO2A3WggzEcmHtoFVubXPBBjCA/5P6HPUWUhhFMwxaOdkT
	 L0wr3AKydKHbt41zbPqXPWRwjplLqn3kCkWt2CiCHKsLxNYd88ND4XyEO67Ey4+T6Vn4W
	 zoE4KdTqg7TJT4wIPCeCnIzJQ6DcS+lkhR5hY/pe2vdbBuQgnXnHfoaC3g+Mlnf2F0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795374487;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FXJgBz6vr8LA6HCfds0NKQOzIPEzeSxi9JM33PT64AE=;
	b=uvBDGjyCWtchwGJ1BWG0r9saOt4hcfiRUXFcyulJmNHl/b/j5ik8EqGuJw4piC20d5W6
	 mFOxv3iPXsC8ohLunIvDQ4dOo9ELP5pFUUhU4oTeG1S/3EoS5CE2ZWmf9XpSoxmGlEJef
	 w05EDDdyqRrvsq9XiDoPo9XOQHpkkuyTZsrVhFnIbK3qB8l/BPFyaKmly04H3XgtUsqOm
	 uDsrrCfbcFUDznf1hlF8owrazerdn0TaVz/1R7IrgalMUplQB/q2Wdn6n9ISqY0DVjsY6
	 MN82PqU6uG15J+YulEthsLGOKAnzh1Gb6oOeZPg00v6rzJs9l6lcD3ajsHicPCp/klQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="L9YWdp/e";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EA7606A68A;
	Sun, 22 Nov 2026 19:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L9YWdp/e
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795374486;
	b=Yzjp3gusJ7fUiPvfUVUOCMj8lr6ERrxeUaRMjc4ASDMOU1cD3kKDzUqSAj90mDw4wijc
	 ODujy7luWPqlkVT/3vUtTcj2GPnU+ZCfEVJx4jonfMDCl3+TY8B67pjR/Q9KAU8DcQxk2
	 zA7oSNSwgpI1QOJx/uBIuiQJvV0CIY1n03uqi8X0t8DZIp0xR8oJhw7KpNhPiIsFjDAZi
	 TUBu5r2Uzy09wYTr9gf6dYGaYfL/WTEvWLVDP9R9M6uqP5ku/b7YXC5dwER2vGv5Y2vP3
	 yNmn29PpX5d6iV992//7lh9l7Cx2qcQaH31hPvzjip96GQMGIJ9xJ/Q8FetQE009EDA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795374486;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FXJgBz6vr8LA6HCfds0NKQOzIPEzeSxi9JM33PT64AE=;
	b=o1Zs/lptLjJtbghN0f0zn66B4HvFsEZJVDRVRvcglkXaFzTgECTd9YtEM0UVkpsfPVGC
	 kMqOPUUk6sssyiFv8Wh9hNAs5I7We5W6hY71D+5mi236q5kR82xa4xYWij+N7IUGSspWf
	 4R8YF6/UbdtkFQAL+2A1I3EnetcR8KSrXDFsVCyYuIA3lsF8Z4FK7jQKbb6oTO2SOivrY
	 EphyhnE6sKOuZ4yZIth6IwvLzdeJf4F9H1ewZnQDPv5VvVcYShFAcojuRAXl+vC6y4VMT
	 Qhq6h3D87HQwidQGEnWqqNyoHhTiy0E5AkWHD5SJIMcLLAoSG2Z7FCnHOgBLKQyVtHw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1D3B01F000E6;
	Sun, 22 Nov 2026 19:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795374486;
	bh=FXJgBz6vr8LA6HCfds0NKQOzIPEzeSxi9JM33PT64AE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=L9YWdp/e96TcuixPRjTA5tPMFYsKHM7XUCF/bcnlmNXChI4Ge48t1UiAuBUYimQWr
	 mf8nh0gst/E2H6P+OCkaJjnBZ08pUt5ubtlWPw1XaqkkYa8zvliDEHKJLlq+6NDNZv
	 nKFv6/SFs6Qyys93aAiOPTyQejy6W6GK/wLj1JGhwOZ5+olvM5oMkgNeBu5yNVY6yT
	 ZwgFkm3Lz01AUaMNW0dekPMhpm5B5W6z/Xo88iWM7LX76WvUQH8Pp1aHfNSNnnQ4k+
	 ZpDLBNVPjZ11osdTGOkUTDQA2yRPQTZSGJt2UXjyAovAFnBX7rc2EAuWW72WOMgAhA
	 dgMd1Fc6L4yAQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B3F3C4C1B1;
	Sun, 22 Nov 2026 19:07:48 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 23 Nov 2026 00:37:51 +0530
Subject: [PATCH v4 06/11] dt-bindings: arm: qcom-soc: Extend pattern for
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
Message-Id: <20261123-molokai-soc-v4-6-851e5a9f4878@yahoo.com>
References: <20261123-molokai-soc-v4-0-851e5a9f4878@yahoo.com>
In-Reply-To: <20261123-molokai-soc-v4-0-851e5a9f4878@yahoo.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795374466; l=1622;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=VD14FFXSRlsFBCtWWzPO6qLJHtCRQHevg44GIXEHArA=;
 b=dBke2/qE2DzmMgN0vyww4LshZCKOfXsa86SGXZxxxRErURBIhcn0dsfBsf46Yo2OKx8dYtCpQ
 wQSPNbah6LqD0mOcwD+jt39HqAQrBfPsPDZQD8yOqiToeqNpFsM6C3e
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


