Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795190008;
	b=o+rKPucN1LxoQ00XGbd09Y9/+Pnxu2fVR6+xkC4y91k64DjlVkhpmUTzmfL62FIBZ4LF
	 b3nHj++MAgBVpUbm1ShaBM4ez49Hw3NPjMOz3m+CondWv8FsRqD3rvb76ycgtmFm5mg0U
	 SMXxh+g2VdklEzb/o1O/m1gbrpdiKyteLyFPqdqw18XVJpAhcYzauI8rqH1dBFvl+w6b1
	 OZxp7DEgRphIlCHrqsvmg/+zlOlVZ1sVgElAkhl1NNpWbe24fmn2mSUIp7BJlxbG+wkQ6
	 ewmHvq87IspW3F/iy4ir8102+X9Jg6MPZfRcQWR6Lc0/d5kmfawpe2GZAnJSX2aFF4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190008;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=VBLBaZZy77oZ2WH9kVOPCsjBsXe8rDf/vkV8C+2QWiE=;
	b=ktT00Lq4rd2YYRbZlKPafzw6wZ0bur0qivkkftT/KYaBtf4zNQvKpdLfkKSHgy4b1wWP
	 CGV0SY6UknOtqjH6zT6dky9NIR1iYYbaE3mjlTW8kZcLmJEWYDJkojjc2H32qXx/BX5Yg
	 LzlpZhPUlNkXJ0Yml1Mk/6ZE26La0JH3brE4sN/pm+aAvCjBSWdMjNvfB2075rKX9jpjY
	 3tAOx4LyCgekSlrjUomDpzh3Cc9hdk6QJQUMod2am4g5pHdMgk4EFulfYc2pPuBymdUWQ
	 vk6+NqJ27VkJAXHVSqHYpYswu1nz5N/UyK2gPaJzrs3ZTB05ZIungI4JYyNcjf7r3tg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d8UkUu8S;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C790D60A2635;
	Fri, 20 Nov 2026 15:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d8UkUu8S
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795190008;
	b=SxX2TngRxUL7w4Vz0cpJFEeBedPxTbI+q8ZJgL0ebpIjBZkiY4tKkN9lJHII+VihyTKO
	 ONH+QgP+EEZhJKj0dTF1LnkMsspiNeo9WAWSc8omcuDc9As1OKobfLoLpuZdJm1iD4E86
	 nV+0/1no41gVq71gUl1l5zWKr3AUxM0JeedeftEyw2NLlzrq4veFTUDazW6NOY4MjBmlf
	 V0teinoxKt95bzXdOgzanhHx3eeuWFF4cnfxOFIwZbU42UYIRahK/5vzNSsbL/4C4UNsC
	 MzaD/r1A8Jxf8mhNaK9+9RcbznMS0+PdjiXjQxsJb5juYD72xM2LsNoRtNg62RaFbwQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795190008;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=VBLBaZZy77oZ2WH9kVOPCsjBsXe8rDf/vkV8C+2QWiE=;
	b=RkHbhZZcfMudbw5hzxfuvKEPkBz1WRrFa2om6nNkDxfy7rXfAjc73wvoKrzUpTSCtSP0
	 QwO5p7/ojIcMHmqV9xD7gUAhcnFkJZRZ1qaorGuaYNd/nUP8EqJmLYJPOMFRVOdamdXpO
	 lFMftVNcW6qeiQM6MuoO6mVlWWxo8lFqY8n9s6iJ/gA6qz2VcJE11vXBBeRf9eSDP5zVh
	 ADujNp6PZAMrIXlnN3YDltrijCc6uumJyV/1wpJ0WW3dprUOffSqYCjcy+rNCzntA9BUz
	 GxHG3FWlbHFp/Wrf863KfYuQggE4Dbrwlf/HFrSdoGMH4LGfYZGW+BvOoAFS6peP4LA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F06A01F00ADE;
	Fri, 20 Nov 2026 15:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795190008;
	bh=VBLBaZZy77oZ2WH9kVOPCsjBsXe8rDf/vkV8C+2QWiE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=d8UkUu8SplKmOsfJRRkGm5tvwq/Srq73P8K+zJ7JUVkvy4xYvHPEYTBvL3kP4j+l+
	 zCxxTUK4TZjW+TBZQL1Kw5RByuYO3pnRGE4/aPygmr8k7O0S3t0TPvCeX1ERhqrh8p
	 /riEvOWAz/wtDGsLxB7uEHnF6Q9HUjZ+xopcwLOAX04cd7B3yMgpOwrSctWBbhmqzD
	 ObDrImZ4NfwnsOK3i+GXi6eQVj2OlvgMAPvkMFMxgROsrUBeab+bp4SlOcZt9a/pJ+
	 z+xKdVQEKcbaoRJqWpOB8zDiPtJGvql/iPh5jnNMR2SMQN+uGsrq+BpBerKmAql/JS
	 Fdm3fcBcXpHUQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1B91D4993A;
	Fri, 20 Nov 2026 15:53:05 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Fri, 20 Nov 2026 21:23:07 +0530
Subject: [PATCH v3 05/11] soc: qcom: pd-mapper: Add support for Molokai
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
Message-Id: <20261120-molokai-soc-v3-5-403d763685d9@yahoo.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795189983; l=943;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=IcJGBEFFIC1fLAxUDNSIKti4IwQ+MXiiJO13Sm2gbVs=;
 b=ljZaubNqPnl+QloLKcv3baKD3ZtswguEE3p+zzqM/wqGhucv3qHq7DaOoPN5pIsZ/qwhpyT6x
 Xjph7XOFc8PA+tWfbS/QmucKectyFA6r2IwtfUDs+Q/p6L9sRw7Ax1C
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

Molokai (SM8845) has the same remoteproc protection domains as Kaanapali.

Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
 drivers/soc/qcom/qcom_pd_mapper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index e38647f3d7fd..b7800d4f8370 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -634,6 +634,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
 	{ .compatible = "qcom,kaanapali", .data = kaanapali_domains, },
 	{ .compatible = "qcom,mahua", .data = glymur_domains, },
 	{ .compatible = "qcom,milos", .data = sm8550_domains, },
+	{ .compatible = "qcom,molokai", .data = kaanapali_domains, },
 	{ .compatible = "qcom,msm8226", .data = NULL, },
 	{ .compatible = "qcom,msm8909", .data = NULL, },
 	{ .compatible = "qcom,msm8916", .data = NULL, },

-- 
2.56.1


