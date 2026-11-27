Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795804777;
	b=Fr5ASsxH/Qmgo2kSIFKZicCvWp3pj13KW64AhknuVqm489ve7eghKh38lVsTjaWKfQp6
	 fBs7/urqc4PJhnCSF5pLJPTBN/if++3OAAWUU+VAOcAnvji8yl7K8SuD8veRxT1inMNgJ
	 kze+yVZnjHfIbfZZKO5lYLizlWsbSrMvproLwduQo4n+ububZIJfslXeg8PIiRIwpT8aF
	 Ozh4rk62wtKgHeumfOYbpysh+rK6tfxjTI4qw0M/yvjmDqcALIfYDFdbAfES6nz6Otcnf
	 V642SKPz31Sof2QhHUz8icgdj9q1ETfGe4fn3FJU30uytP7EpSBtfuq4gaccGJrH4Pg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804777;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hpAdMigBPPp+PH7GSagQlv9n3a3P1AhRhsl75+LjKms=;
	b=bRtK1lmtIbjzTl2YsI5Lp/Pd0gHXOhz3ycO8EJ7EUc2rnEZuaJw0hwA9hjvWlg81VnWr
	 pUT/FWi1bmXmmVDht7bq8G9FIz/sPZIxVlbhf0ypM/Jn5qVd2xtS7I85mCWhgZOVfridj
	 wN0rlVnXVD3OkwnbkdVLVlKksioyYnd+yOh/Nuc7Qt8R/9G3jCMTlXweme8tVei36olZB
	 RjYksHbMiKhcvsAHIw4fZbPBr2TyfHu4yc2kHnG8BbfAVApLzz3aW2VY28skhgzOhs4E8
	 giIv0YFuXlP4WpukyUkiGqgxKk9eW0Ydu1OEZ4GLHlHWzLYj6jiXl+3ZMXREG9/NNzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C+5J6I06;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A73F606A33A;
	Fri, 27 Nov 2026 18:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C+5J6I06
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795804776;
	b=ElpKUSMFSdc7SHk5ffK1JxdeFeK13biUeaBa2+GV3TyxllArHXa9DYD7pkPihEB4l6PN
	 l72Kr31BmCz+9PObNBsF2QdwUScCcztlUnxykOY+JaMOrScegknbxCzgLfRIgRC6CJpzp
	 BF7J5FfOWhdMUgGIvAg24Yje152E8YmWE7yk9JW4VOasL5TbtriW5nfFgHzwErX+YB9sD
	 6xqGfvyDuVTFhwNixMMRn+/DTMvfL2lE1wr/2SHYt25h/xm9dYjptcDqrvRnXz4ZmQBxs
	 pc0opLHqHNrBiRUl5vZTqlbvt6oGNlBgn2FuqouAe44/hv2AA47kyHzcEQ57dk3q6/w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795804776;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hpAdMigBPPp+PH7GSagQlv9n3a3P1AhRhsl75+LjKms=;
	b=Un3eZM1LaY/FuLLVKvLCgkkMnkbZPOxtxbOfDQw9VO04MtGnWuUyj4KOB8BZDSPtbTeN
	 wPkx6zIMIwBPF0DladN3vt/x83Un42kDeYrlPVGCa+QjlvWYBbouGF8wXOU8u0wG+TThN
	 kkljZJvi10pc2vnl/I+Jcl6Ls3vi7D5fiLecgLQQ2UbLKT+axLHG0GrIct6JsJfZ81GEw
	 4sfJ+ioW7XhMrgg29gxq6GsKkfjECND5dKZli36VvMFzC844TBZpqRF1PCP7LX+dguzA/
	 prpR9FYQm0ciA0edEgNUNEaZawznfAoQMcLOM46KsfxLTeRClG/iwid6WmHOuV2bc3g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F11D31F0089B;
	Fri, 27 Nov 2026 18:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795804776;
	bh=hpAdMigBPPp+PH7GSagQlv9n3a3P1AhRhsl75+LjKms=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=C+5J6I06uLQQ5TyNYgl7KiclptoitZHORJ8jCC+2uO7OqdaZT6+5HOT2c7FmYq90W
	 GuwPdovXueTLP7rq+sLinECEebLekZRntkwpeojP4r0NWOl/idPYVDBMbhneZ1EPTJ
	 RkUzFfpBQ2JzvojlVGoA2/84ew89xEobzPvLGy8z8T9Mczw9YNyG1GH8j4j12nLp4r
	 WVnKgkNvt5Day0RPFncW+dJpQbq2hqi0sFarFZ+PrineTwC+4/WKigCY6vJiZbPCii
	 qJWBK4frHW11OqHbl62romBaXLMRmIIY4YZLszRE3OnrwnpSWIBhbcoCCYbueHLrAN
	 YCN+lQ2akadAw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 819034DD2E;
	Fri, 27 Nov 2026 18:39:24 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Sat, 28 Nov 2026 00:09:21 +0530
Subject: [PATCH v5 01/11] soc: qcom: socinfo: Define the SM8845 SoC ID
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
Message-Id: <20261128-molokai-soc-v5-1-144801dfad7f@yahoo.com>
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
 Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795804762; l=812;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=k6HqI7lXxogfHltCEOVIpJCxC5/r/ZaR6jpLGT2PIZg=;
 b=21vVkEk43Cs/XT1BKXH4/fwLbANRhqyAie5/IchWo3wKjn30cu2DS21Y/vNcHXelYNtbs0JiU
 S0H6/bND9awAJCoS6WsQN6OvbJyPijanU9KoEJqBEI2vjx2b6pwQAr2
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


