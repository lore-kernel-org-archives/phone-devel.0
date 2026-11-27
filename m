Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795804775;
	b=rszcgtLhR24kwan7FkWAp6VNKCyn8QtOPY5tMNfrS/PAkRbhOxPFiYY5qNQlbwH7iAkA
	 2eQfN5jKn6i/A4b6fwo9mhXuiVM0hyxqc9aQ/KojZpfsKmcGC5YUPRoIxHUV9mP1mVINH
	 Vc//JHO5+//iXSaAVfDd0JbxbIEJNJggOL/ofXuQvlgipLuQKpZgF3djRiBYeKT+sQEDh
	 UW4G1MJkRrMDyTP6Feam9fvw17oCEcG4BucC6lo/xBpBwbU1wKKm4r5Z8BmJlABvg5lfL
	 szHs1r6hOuSSlzJolOPZvU85KmqKz0tvY0DCUjwf+sxr3V4IhKZNwi9F0DpofcwRliQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804775;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=fN016Ani6Rp+Ym/1nwewB0a76sIl1PgTWVmpnxhEMU0=;
	b=t+6kqRjttdPRAowzgjrby/UV63sm07TaKKos9z8UJqXqSu9YGTm7D6tWoRigz/iS/Whz
	 gGnYzfgHEgLooN3ToHZPYPYOKY/NlhA65PZT3nCkUhroJSx0KXLFR4+zJnqGrduO+kiz2
	 9X5amXtCTuJjHLB7WzG2E19uKm2EuS66jlpTdwk3v4B80NWFMQUjpcrdvo0mONlvM0T32
	 +bX7yhfHi026YWNKwyMTCAzUZFHlcojKqRoT9o22Ch259mubrkV3exE+61l1aOHeADLcq
	 vJjNROpIzCLL3uhsuM5e0vOehQeCSNTdPGAIxDKZnMkLuMgYs/VSe9MPJPrH6a3HalQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PWP8gTOr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D409C606A686;
	Fri, 27 Nov 2026 18:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PWP8gTOr
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795804775;
	b=arirgCmXiWjDzERR+0mZNT9g6dIuLhhjXLlCTenGd+ene5kyudLP4pwZizcNu9XmuFWs
	 0IAaD3zMlWe+mxYlKxAKMhG6BukgXPtTPaf4Hy58wkDn5kLK7KscMaQFrU4ohCXtVRvAs
	 X5wLepmOEv6b5sPlJeRglq0/ME0STVkZ1DNNonq9eimkIMqIk6LtypnHt2PATA9sQ18ZZ
	 /Ij1ncP0o9zPx0swNf2ee+ZXhIsvDLmn5iV4+htdh2QmznHd1ITnSjyopEzcL5PlIWxtn
	 KL0MVWLi8VtKX5wbr8SXBT5LYYg8JQ3zF0uHyDTXtHfHKLIPlVkEBzvbHNsung0ycHg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795804775;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=fN016Ani6Rp+Ym/1nwewB0a76sIl1PgTWVmpnxhEMU0=;
	b=PmbeQeNiCU8qZU9yRLbu8L5/74dBturvgTBjgw7ubiiuWHAXn7rMFMzlRPCp8S240oT7
	 YBVhd36EzgbARZ+d261FFAQFhHuK+xPtwgs8IZRO5eSaaFJqZrNuT5B2vmda72obk8dt1
	 TYpL88PxUVtto7EbcqDx+XTnsTIH8SIYtLJ/uHxD2T5boMR/k2iPPo25fEM2GAF0j8Wjr
	 Mz862Mfq6F0G9SwXQHdVZDzl+UNARA8FBR84VUUJ2vbhooS3zvY+CLSdTtGPMSts8HSxR
	 lSz8W5vq1eod3aJi5Nf69onpXi9b7DWNz/mz/vwjhELApEgPIGlyG3bHSFeIBkcCv3w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1D99A1F0089C;
	Fri, 27 Nov 2026 18:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795804775;
	bh=fN016Ani6Rp+Ym/1nwewB0a76sIl1PgTWVmpnxhEMU0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=PWP8gTOrJBNebuvxiWXCiJJHjgRyEdsYzsaAwAZBGvCamWy5kc3QcdcCVFWoqHxNc
	 yyRyksXJ/kb77aXw0nis+esRtFwkpVmdRddoPzPZKXIzcvEEX/9RjpAMaS+nctYkjJ
	 kCXIGbUJKg+DCUXKcc/x5L58QZnmr9OLJX7Pk2ljQBX1VMKI7UEmg057yFe7CwMBEn
	 hup3ZMs07kmLXaY6GDsLR92zKc78LLRwa8bzUjL5NoIw1ZeLrA6SfD27S5Ja/k2i/B
	 bYoPwXb3dgNia9Qj0Q9NxPsSFL/18ND14iUwZ89X/kazViv51uYankIx0KpQh/mg7V
	 1zJaFHIE7/OtA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A23584DD2F;
	Fri, 27 Nov 2026 18:39:24 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Sat, 28 Nov 2026 00:09:22 +0530
Subject: [PATCH v5 02/11] soc: qcom: socinfo: Add SM8845 SoC ID
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
Message-Id: <20261128-molokai-soc-v5-2-144801dfad7f@yahoo.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795804762; l=742;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=IRJIefuMwJxDPdNxVL+f0fcPDYIY2lpI0UcMgrvWU7E=;
 b=rzOeIMDInmH95/ptEtk74MoA4Czuoz+G/pEND5F/v1uxJwB4bckHOVKqHUpTUVGwuCY5n7vE+
 oOnS9vQ8HOAC6OOIL+oONg6J9K4MQzJg6NmJm+pR7lxQyvh6f6gZGyY
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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


