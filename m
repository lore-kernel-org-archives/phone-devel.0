Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795374473;
	b=Bh+1rulC+lJ5+vvkhDWZaRibPsAQQOwrUEdWYvozhMHPPNi1je7qQRHO5G+W3tVGbW1b
	 P4LvjNtSkE2KUfUezSnrPVuGOazGNCz8BUdGwEBCULaOb+Qo7/6IeaCDZk0pOB5JtH/7H
	 c0o5eqj+HVm6Zx89Mh+tMxIRVM/s942E5doyXZagX+4tGhSS0R33NKtCK8eMvYzv7U0QI
	 Uaw5z8BAkZnjXjxTS1gYs4hOXIgkg58zbXKf7zmeovQYLgWbLGXXbsoBIpMMg+vg0z7an
	 blJBt5J0YsKDeY0Kh1qwkxHe8+qDm08FnqjsdzNYEa4+dSk4FFllKZchszH75wAJ0hQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795374473;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hpAdMigBPPp+PH7GSagQlv9n3a3P1AhRhsl75+LjKms=;
	b=lRvX3erWmYhri2/dDvbEaOlvRgQEOfYdXAWA5nwwDX0mzrrfZfQyNvTdHNH+2Xr6GcL7
	 5RIkZWwpu5xEQiqcFU/Y4JcEU762G877pwQIV52B+Dxv4QRd2bUmHt1ImlGVCFcVCV/bP
	 llYPQHlDwz1ogvHkL9VVV23b0WuZpi0KKxeGbSeA+Wx1tnx1y0GSogZZEmKpfLWxD0wFy
	 6PTFgaP0d7mgolzxi6rTbZOk8YK7g0ZgQMpuhzlZs7fZgMlg+TEl/UZbnfDDyRlopuO9n
	 wJVUZmaVDlfIL50z3dhiYbDQLHkY+kV5DccXdH+eYBrRFckyEUxkWmc18O9v24J3MxA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NjkBEl0G;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F96606A320;
	Sun, 22 Nov 2026 19:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NjkBEl0G
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795374472;
	b=rgR+5TlxeeULkKnyVZ4Gy9yhBof8c/l3/jrUJD9LgYrP47cRSNIpICnxCfO4uaOBOMFT
	 twibXxMgw09XL7nxrC0j/TK3Ki27lUehmioCxbpUA/U9/l3sUfxCsnxn6NEpfmH1N8muS
	 N8BZb8iM6CFS4RrbthjoQKk96kSnofjpaS3Pkq8VT3aB9BDV1R7VDfzLUIXj2DuzvahDT
	 dYBcATsR52BcKhdvReilaOD1fcQ1Q5QXXnNF9DXlHjYsobrx9+BFVAcdL6TiNSpwRldPq
	 QERx8f+F73JefT7lLl2cC6o4uORK4XC4LBEeL//KzlK2/xRU+qHLqnY2Oh0fgSZr2ag==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795374472;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hpAdMigBPPp+PH7GSagQlv9n3a3P1AhRhsl75+LjKms=;
	b=M1ytWjUmLh7zwVhPMBAvkGt97nI/t3xX4dq9PTeEt3E8Q8eeV1YlBmpkvCO7o8aO8BjP
	 Bq0eVxbjpt/vp74RwjYx9LpyLtzsQVNkGku4kwF6uxDmt0oyyWfHLOkcuFgeHVdSKanUG
	 rhOCqBD4LQc2FIKuhTo5a+wHFop+AKXLeyAIXtEACauS+DkGC9wUN9hRcbTgPCCmgNU3/
	 wBMke2MWtwIa5zj1Pb+FQ3d9STz0QULhEL8whJrcgnqlEN574hNvNbGK3fV7XgbSjvUxe
	 dK3FgJSYXiFgMs5DXfYx9midzl9sRXavX3ysggPLWRiP0t1ZDee6aogZ90cDsxbVZVw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9C9201F000CA;
	Sun, 22 Nov 2026 19:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795374472;
	bh=hpAdMigBPPp+PH7GSagQlv9n3a3P1AhRhsl75+LjKms=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=NjkBEl0GwIX/2/mSwZdzfR2LuwwednX7yevFoOujxXzWiQneHtsKrJr8eMg1Sgckl
	 JwtI2ji2QWG2inP63d9SWBM9nk712Vfzbxe1VfReksanfkL2MJYcXtLbMKo3jYo0eZ
	 j1ivsU1P/LDkwD5VWV9kIOxYIjeAPBjo+GQR8o6J3n/FMEKrOw3EGfI5sGM6TYNQUA
	 co0L1v91MIAwz1VtyLi5Gv8dLXKlgGq/1nuwnoPYXVmrH+7Lk/7smopEqJqlRMuWI/
	 t3P3GtZi8pKemWW95MjeqRn3z8rr/u2Dc9LgcTofU+sYrgI2GwY303m+ONq4zt0Tit
	 TbknSdgxhBVlA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 20BBF4C198;
	Sun, 22 Nov 2026 19:07:48 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 23 Nov 2026 00:37:46 +0530
Subject: [PATCH v4 01/11] soc: qcom: socinfo: Define the SM8845 SoC ID
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
Message-Id: <20261123-molokai-soc-v4-1-851e5a9f4878@yahoo.com>
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
 Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795374466; l=812;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=k6HqI7lXxogfHltCEOVIpJCxC5/r/ZaR6jpLGT2PIZg=;
 b=huKNfo3uPxQYRavsMLtMSb7SwJtczZkQu7uZtbc2HzNAALqrdjHo+TrPBbQ/PkepXQU2Y0y8Z
 IV9e9c3ikViBdVTWkw2hCRa973uKld3p/mYAFQ6jc1iNA7VFkJ851SR
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

Add the ID of the Qualcomm SM8845 (Molokai), a variant of the SM8850
(Kaanapali), as the Motorola Signature reports it in SMEM. socinfo uses
it to report the SoC by name.

Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
 include/linux/soc/qcom/socinfo.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/soc/qcom/socinfo.h b/include/linux/soc/qcom/socinfo.h
index cd2e8eddf3b5..fcdc750f4b20 100644
--- a/include/linux/soc/qcom/socinfo.h
+++ b/include/linux/soc/qcom/socinfo.h
@@ -184,6 +184,7 @@ enum qcom_socinfo_feature_code {
 #define QCOM_ID_QCS8275			675
 #define QCOM_ID_QCS9075			676
 #define QCOM_ID_QCS615			680
+#define QCOM_ID_SM8845			685
 #define QCOM_ID_SA8797P			690
 #define QCOM_ID_SM8975			707
 #define QCOM_ID_CQ7790M			731

-- 
2.56.1


