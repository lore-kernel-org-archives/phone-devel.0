Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795190005;
	b=xU92ZFcNXpeiNkOlob8xAIeTngmnzHqFlJuKt0bMl7jTdeD3Mt34lTQmblCmaHOcnXB9
	 yML4NuAlhQlm0hBLV/mORmG/W+8L3DOfHUBE+z9T6xbxKLPpSypKoVm7ff9k/qUahbegs
	 ywXMG85W0UftY10rFDsXRbOK0DjisRmRjfT6Rb8naxToA34DA4yGvdrvhE7POz6MdzQkR
	 trkchrC2mbY0u4n0Q9dgKkD3Xm7/DWBd7ClmX3t0kxxAFYe9Z5kmAHUCV3UBqYpAffF5l
	 iZnv10n6LyTQRbwAk6p3/yBvYm5X3Lbvtn2M6lpBQFhfw/qFthtCZcet3d6gOtLToQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190005;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=5/OE6VgknjuozBRKXqKLM6rt60j8NmlxH8BiM09j1AE=;
	b=1N5DRm99Ycwt2DffsqFmwnCeMcyrJHcc/Y/yojOfZacg+5AeKoFHRGZYfIhyGf3BJLqT
	 tQU0vCkqU+qzXOmRMyr5jNQS1EIp2H26qYsayJctQOMJLhWnCpidNOIDgiuj4m3GfQ3PY
	 qTvRQE28dpklyp5arSHNQCoRCZe6+z3CM9Iz29nv2/+VqYSwInJBQ0JhzB5BZcOiJBEZD
	 QT3LX7o5rxgPhbYa9pcuqOppTQ752L0R1HV0FbunNFBoneaCzNfG6Qvs2QMWqv3U8tQD3
	 i6lbp9zx6/NNu3zofBgfPgWbh2S/CbYZJDTJvYdZ4icQNckf8T3VXwVlcHnrRL4Sn9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ALBjgfGz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD388606A32C;
	Fri, 20 Nov 2026 15:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ALBjgfGz
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795190005;
	b=KtjMcsJlvYkpp91BtZhhAVZWa+I8tMLEh+AZfN33gh847x3BwWgD4ywPXY/YKv3tdT6w
	 aPYIrCqfA8M2R6+ww/b6iVpPV8lH3j20gZMUjWoFGdP9h5yGAT2KGARV08NPenVOm5fwN
	 hgi70TWAjyJpDNFkzmAjmsxM7Vp9g2m2J1CycmoRz39oO3HGHD5fM8cI31QXy75QmLsFt
	 32uKmcyRyBpR9NiVsy+uAx0xR2ghbmUCOK/+5FA1SDslWdSwkgjcV25VP/J1+n0R1aHHJ
	 lJHvoJDsvsdrJ8Rbr7YdCy7Cx8mcgAuGcaYhQUG/sOlryoojN1ZZWxfEqfX1LnLLTSg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795190005;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=5/OE6VgknjuozBRKXqKLM6rt60j8NmlxH8BiM09j1AE=;
	b=xEOTyij8cgtRaVW/ZbYhaaWrPTFDod68HsrqpLXEHDlZu5u/qVP2PqjOVv44R2EaEAT1
	 X7q2nMgBdqkbrNDk9NF0kepWzHGfxyxXtkrPpjQI/qOIc0vplGRqzZ5ZidQN9ZuubY0fX
	 Va+fAgN7zlwSvCG4SQfTZYtLZd4xLO2aYyAxtOYI1IGNylh3o7jbH4tyLQhC9+jAp3ZZd
	 6l8uWASEHZCyC5zRyNQoyH8gObb0FsSgolSaxfyYleszvA/CPlzHRUEfNSW4a34n2V0Yi
	 LVRFD+gHlhL0Knnclvkk0jDDBP6uIWBVm1BFi6dEWrVGOmH+GyfUEKdXEI9wNrkWtCw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 43F1C1F00A3E;
	Fri, 20 Nov 2026 15:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795190005;
	bh=5/OE6VgknjuozBRKXqKLM6rt60j8NmlxH8BiM09j1AE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ALBjgfGz7Fbq3EWTy9Wf8u03BNq7pzhxgOMBMmgE7ZgizzdVf6lZkspNHiELinO3N
	 Nc3jshlkwwz+1qwT8lzbfVyx7NISqBWNmdE6f9bfiZaD2hWAlScxVYsCtpjGOkiDPb
	 CK3cEMYR/6tWQ3mD8VpGELbJn1cIaY/9hF3fklGc58zRGLP8lwHDiVrkWGxQ4/R+nR
	 Du4EunyjkYOk104lk7He1QdnBJq86SD/JT10NGq0X1PVt1uUeStAOKB0nndwgrsTgh
	 93USdyXgISkFyNu3l4h298e8sHmjlTb8RSTsoMEdK5lSdqpRJQtIm4lj+a4KasKrDt
	 KNi06EFF4cZJA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C927D4991B;
	Fri, 20 Nov 2026 15:53:04 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Fri, 20 Nov 2026 21:23:04 +0530
Subject: [PATCH v3 02/11] soc: qcom: socinfo: Add SM8845 SoC ID
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
Message-Id: <20261120-molokai-soc-v3-2-403d763685d9@yahoo.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795189983; l=669;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=8xw0twAksMHMX47Apc9L+1JQQiLJNoWw5JK0Kzy6y1o=;
 b=Z0wiU4mXxxmcJwPwUlCho+OdscD1y/Gq3jwxa5bVrgxFrqea3BDA3lWQPta/X5GY6xqyOHcov
 IlFnLA0CNzRDbRzSoGWg0h+NrjKVudYgkXOkRaR3r1xSQItBZuO4KWM
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

Add the SoC ID for SM8845, a variant of SM8850 (Kaanapali).

Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 18105ddcf04d..718d1fa7e830 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -541,6 +541,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(QCS8275) },
 	{ qcom_board_id(QCS9075) },
 	{ qcom_board_id(QCS615) },
+	{ qcom_board_id(SM8845) },
 	{ qcom_board_id(SA8797P) },
 	{ qcom_board_id(SM8975) },
 	{ qcom_board_id(CQ7790M) },

-- 
2.56.1


