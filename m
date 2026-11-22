Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795374486;
	b=iCw1J6y/eADsnn/PatwE76DkXZt7k1yNgtuHJnLOc9H5FFxUm/iw8j4uECszDUaBDDq6
	 X2AAni9UxSXOAdedyrM+Ld0LMvwcZKc47W2uI2zyRSZLT1xLflgkZA9Kh1a1wHLMkQY9y
	 ik8cpjFdn2OptmCUrOsO28rHYjIUow4Nvdp9v4rdLKJEGgKH+72zty5+6CQeNI/TR9ozH
	 tIQ6AVWSpBOODTIYUd6PeH2RMrxOzEFlR6DcmE9IQVpHtJc8xpti09YSwqPjcCcxNQV3v
	 9N+OII+7sIpQXTiH7q/qk4AEQDRryRr7WggudStCfT6fD4PfmmkWcmqPbunAijQuUTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795374486;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=VBLBaZZy77oZ2WH9kVOPCsjBsXe8rDf/vkV8C+2QWiE=;
	b=XKx+3wGorQdB0Aoz9g5WBKc+KCXAsYFPfWZfDlwnWYg4y5Ba70mCz7EEAcBzGZsOMHTf
	 hlFM3jjpsIij3OqF4LwlGmKJNHnDprjGVSQfWAkfpyEXbi0U3L2ccTBgzSLYDOKZQ6lPc
	 tuX5hm4OTMcRH22XwNgHgrBF8UK3F3EDM/n4DBq81XD11QVnguedWJthH9WMXxi09p82w
	 URS5gSShk8mZyz3D4jdhwR0y2aA7ZrQ02oyXFWmo0RyCBlYHzzdW7gtQEQZFC9OVIK8tT
	 98HsmGJJ/SrDq12WTtnrYrVZyIkowoGD/cDDGNYX7aozPiyIkaqjkh5ssQ16JdMNBXg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W37aXGvW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA39E606A33E;
	Sun, 22 Nov 2026 19:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W37aXGvW
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795374485;
	b=Cx3rcxepVL2x6cp/AJjzaCL5jcQW8M53ptRJn32UFLTVdGj3IKZ8fTplVtkA3ni/F9IT
	 3l7w3mvqlHCtjGCeoNjP1D9oiC+S9IwejX9Wa4rxymxz68gFog94CN6Z+rYv6tMpdUi1I
	 992WRI9spaXZn0yHIqFoLKE92/vQCo5lcmZHH6XjeGpuqGIk+/fct7JOQSz7256HG2CYt
	 ReTaFeJVOnt+97sjLvcDi/FpA9t3JJoCgJS43qu8q89eLChd1FeZ/uhzqJaNlSHXwJ+m5
	 t2/Rglp1iAKcFi8x7e4bjwo8E+YO8zoj689YawRXjs5lr1eX9vhdu6Oh3Q8QTi3FxgQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795374485;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=VBLBaZZy77oZ2WH9kVOPCsjBsXe8rDf/vkV8C+2QWiE=;
	b=dX2dQGkdWURrWgBFTG8HeOz+rxN74aKy6ZCRNJuGI/MxJhxZUyXCZr28lS3gvuwReLDC
	 AQb4HwM7yl+K/1oeGsZs1NcVogIjTpowYNUL+HokvEYPIyKxrPP6BDrYPlSvfG9jqx0CR
	 iITzDwVrhXe7DHFskRB+pbjScZSzHc6RumgOvGAvgq+fRqjvT816hJ4eXA+L+T+B9Mv2g
	 scwE26ESnNUSXo5O9b4Xtyto/Xxn32K4wG7F4h6yjZYUUvsFOznUtbzbeBZKgV8P1rSTY
	 cVK9r493NyrEDDKu/fy4E2yCB8jhDKj+/pvVRm1kfWVNBEUP9ickGh/0B/Sr5oE1efQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1AD9F1F000E0;
	Sun, 22 Nov 2026 19:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795374485;
	bh=VBLBaZZy77oZ2WH9kVOPCsjBsXe8rDf/vkV8C+2QWiE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=W37aXGvWpANALvbzxNt8pLC89OHzu5u7oN02sUd0Qm18361R1jEjexXESxkRq0LGX
	 Rt9R2qziZF7zhMuplMp2fPkNRu7+AGG+EYiDihEvMSvKIRYBc+7/NvbdfQhRNWurou
	 DLsYOtjtu0dzXRqabcMR75bec0tz82KHNtteFGXms6qb7vdg0wTD07qP8D9COMP1ws
	 sI3xWQKk78hMhL3qFJIKXCdwft5//BpcaYCBv0QCFVavhtaijb6Y5Aa4Keq2bccQdJ
	 I5T3a84SH5nO4eSoue0yjprumIlYt81aHK7QkqDlGipj8KbabhTYez6GNObT+YYydc
	 WemPFiW91aCQA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 99C614C1AD;
	Sun, 22 Nov 2026 19:07:48 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 23 Nov 2026 00:37:50 +0530
Subject: [PATCH v4 05/11] soc: qcom: pd-mapper: Add support for Molokai
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
Message-Id: <20261123-molokai-soc-v4-5-851e5a9f4878@yahoo.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795374466; l=943;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=IcJGBEFFIC1fLAxUDNSIKti4IwQ+MXiiJO13Sm2gbVs=;
 b=HYkIeVzctKp6LHfZenicaHoFQbK51+hP8ykqv4hvrUOQ7HRWYHaLUIjCP10IL5HskF2EvYxF7
 Sc0e7oI8a5gAmjWl3e6+9BlkilZwG63kiFc5tUhvnOkR4R7n6KRUwgs
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


