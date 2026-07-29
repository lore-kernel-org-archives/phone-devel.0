Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC0E42B316;
	Wed, 29 Jul 2026 21:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785361993; cv=none; b=ao47dRLOYkbArYwstwEctHDX/F8xuE3XnxDqEQrbw8x1u3C9GzULuS6j1Wr0AHmiSs8+Wm9By5Y/ER5/kraTWnqhD2L+SCGJofjURGRWMYR5PPqhRJjrfNANV1KLG8XA/39qq5/dFig0SdBANhG6KQYXrQ2uM0jW+feDb0nltMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785361993; c=relaxed/simple;
	bh=bzwBFeTwo9TP7bKj81pjW13jUPJlhKBX4aeU4w/7ddo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lfM5jESLuzNr6UBYYzMXV6PVA0GFBj8WEeUZKziOlQaFoqGofKtb2ddZftk46ku/902c97tfzm39lz8dx9PRcrgbNw8zraTQqTvZJ9skPov6lYmIp75cLPbg6ne82BJkhuN6+T9087nGJ47oe6eLEwKfE6zf68XZtFYDJ3PLlhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HL+Mlp9p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HL+Mlp9p"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 823E4C2BCF5;
	Wed, 29 Jul 2026 21:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785361992;
	bh=bzwBFeTwo9TP7bKj81pjW13jUPJlhKBX4aeU4w/7ddo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HL+Mlp9pOGnyW0bamOZQ1LkmeOxu/KtzAwE+JoBmY300MzQRFklia2ttRKNXjm4Kr
	 VE0wK/wzUtlNZvrY2u47gMn4wLHyGpjOVNzHVox6gFYST7IZX9zy2Irq6VtrKL98f9
	 BAaEL0WwDOMhDCzqS9w0ccPzg5RMGMIhf7N5t+1SNRZVGQlyIU3l23kLsDmyXTpfmk
	 2FAj8KStaZAHWfeM5+anP6mw13T7WLalBwYNPVZqe910GjuITIQcHGf806yUCd9qlx
	 XcH3IIvd1iuzNCAi1zto+yVIJKTzWurW305hmY/rPTojh3ARpepeVHDrPRwDnurh/t
	 TNFHZ5uZH8e4Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E832C55160;
	Wed, 29 Jul 2026 21:53:12 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 29 Jul 2026 23:53:09 +0200
Subject: [PATCH 1/2] dt-bindings: media: i2c: dongwoon,dw9714: Document
 DW9714A and V variant
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-dw9714v-v1-1-3c479b3cf8c0@ixit.cz>
References: <20260729-dw9714v-v1-0-3c479b3cf8c0@ixit.cz>
In-Reply-To: <20260729-dw9714v-v1-0-3c479b3cf8c0@ixit.cz>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1287; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=e2G+yj7LX19KR7zqmeDyITbD76FzOrOow1iF5xDhISs=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqanZHxM0KLmvcgV7BdhURDMMW3n6PNAqkcyVv9
 gzpg0sMGSWJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCamp2RwAKCRBgAj/E00kg
 cm9XEACHX0nRCFdRQ1uy/mfcBT9iTEYSmGcPl07ga8humPeKh/FyTHHmhR5vuYMtxEbiuA0ew4r
 5DVVn4hVKqa0m8dT26loel4H2p94f2dxc3BgJpv5TPJ/DTvsv7TGyvFoqhfYSX+nD8jIVXnequE
 nBfGswnRack+s88cdqoor3gCxEtHuZY8mAsgw7SFeJhANjxywzoHjr6OOMgyXTZgKf+xuP5ao3O
 NOD+6n1Jzm5mDlMSZ2pWPv16iNu5Tl6mGcaSdoyOaZG0NVKtZXoE/Mlw6XkfKtWtGEidbr1Mfu3
 7auzvTZ5QP3TbOhTBUdp32BGe96gfyxIuNgWEyPt4te962Z6H2qLMkXC0J6SrfsVEslXirT+tYI
 9/LD1NdTdnjf6ATfhebvJ+Jua54g0LQ2vjXhNf/Kl9JHGw8rgo+YGWbp+9dY0TdpYc2o20ArUSZ
 aVomdeGcs+yEfLpI//D3FmX2sYPpze1qT0FvvPQ4hz/sPmd8g/H6CsWsxRr4XwMngUOnv+LMVb0
 cNujCBLQ8ibDyYbmYrSym7aYC9Fll7vhoV9YjcU0OY94uZAcUmvYusTztiQwxIIfVVEItAUDgDC
 iZw9925oOmj9YO18YVksioL55E3KdCybyoSIsNdzO+bvwuJPsYm2ALfgrLXoSP267NN9gn/NC3o
 kNc8YrQlenf31mA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Both of these successors are backward compatible, but introducing new
features.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../devicetree/bindings/media/i2c/dongwoon,dw9714.yaml         | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.yaml
index 66229a3dc05d6..e8ad2d3448d5f 100644
--- a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.yaml
@@ -10,17 +10,25 @@ maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
 
 description:
   DW9174 is a 10-bit DAC with current sink capability. It is intended for
   driving voice coil lenses in camera modules.
 
 properties:
   compatible:
-    const: dongwoon,dw9714
+    oneOf:
+      - items:
+          - const: dongwoon,dw9714v
+          - const: dongwoon,dw9714a
+          - const: dongwoon,dw9714
+      - items:
+          - const: dongwoon,dw9714a
+          - const: dongwoon,dw9714
+      - const: dongwoon,dw9714
 
   reg:
     maxItems: 1
 
   powerdown-gpios:
     description:
       XSD pin for shutdown (active low)
 

-- 
2.53.0


