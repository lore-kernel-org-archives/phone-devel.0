Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795374480;
	b=dbH3t0JMfEhHvdJ4xVgX5cddB6cuJrpWDBkxXbwdH0DbwSj8vqD644d/BG8QDAgobS24
	 8m99EdfGqWKv5GSbw9aa8bwlySNoqfXhAHa3mtMOcFQva1etRDpzEWSbkdr90XAugYwmv
	 TgoDunaFks99PCAWTf0ocQw5k4wRLLq8UFJiG2qS6yzs2wGaUxy4uaw8us1SL8flWKp2Y
	 M3cmKlUbMkhXwVNYXjZ3r3eWbneagn/1EKk5zHw/AMZCqYTMXl6Y5xOPOHupODpzo8aNS
	 RmK147aAmec9xTReBvJsoJaO/N5J3FItvMQvv8AFl7W+lF5zZXtPWU5BF8wbGceCXpA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795374480;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=fN016Ani6Rp+Ym/1nwewB0a76sIl1PgTWVmpnxhEMU0=;
	b=uRymhVuJ42SqAdH6lpmli1m2WoiLxgZaXum8iyCU10KEuEzl0JK6mK51LZBioVCb0Ki0
	 Rn6HxCIOjw5S9SAkgB+HIZa/lbdvS0s4wcxgr/ploISRzU+CSK/cJyrtXUEwPbkzcirLQ
	 clicfFH5n0/R8jNk4zT8N77CdMw7ePFgAFnUROfSLIduHsTzmsQZekn22oOl8XUyhjUFw
	 19VIAnxOoOooVOYekd71au8XhGx6UpT+6AXIfnEJF9BbKoxCntPn5HH5qXE3a+OLQxHZX
	 mC0d9libZI6c+5TJby/tLhMFN2PapvFin9JAq8mgRLwRFFVgwR1izXpEyHBTkjgqwkw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FwWVTO49;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C51E606A332;
	Sun, 22 Nov 2026 19:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FwWVTO49
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795374479;
	b=DP5jbZe6uXBPVTAH85rkuaifT09J8+s1owze5xVpx30uRFkCwf5lHKlh27FOqO+u/33W
	 bGIzJg9HsuJlXTabHh9CnfLmEAsHMHHh+KKuuohTNYlxGXdNU2G7lLdr2H1cIqlr4RIBL
	 vwpgvERS0xsIOoUy8EYeEj/atrGCJLB57+Fr9B9eX7BuNI686D+pMX2HLb0G8w7bqxtHE
	 3B7M14PrdJjqIOos/6MS2R5LNHbUmDbIupBRsdmRpGd78e2+gvrK5B3TRaSDZUffmvH3u
	 xjndDDjqXJszgQ4hZ05Ls/RhO3+zH2BCZErzrlz6Hy6FrIYN7/0+u+wPJiAfv9P1TXQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795374479;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=fN016Ani6Rp+Ym/1nwewB0a76sIl1PgTWVmpnxhEMU0=;
	b=pwDfQFit+84x5DcG8QDYPMcQ5C5TF3enDg9GJftga+nI1i2t+qQWfAo+laG4S3bcvk1v
	 ygwy4VzqyPmgZIDm+W9798sPVabG8wc7JhYXWS0tx0Z1qH0Gi73DPpGBOaDEGe1kSgfkQ
	 AmXCHKZFpz/RtzDcy6iFVBOGBGyCt1Lo+8tAbcnyjD/OpbKg31aAMk8T4khwPiqobt5ZZ
	 lTqXcIhtstIjr2tLkjiM0XTAoCCULARzkTexYu+SRFncWcmHDOmII+SKsJetNo/Dk+zm8
	 ZjfdUf0liSDYSj6V6VAbYAIjrchhOfnvuCyqjPh5liTJgzofUIssw5H5RRNQmsjJcKw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AC36F1F000CF;
	Sun, 22 Nov 2026 19:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795374479;
	bh=fN016Ani6Rp+Ym/1nwewB0a76sIl1PgTWVmpnxhEMU0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=FwWVTO49xgPrWsfn1hkVa7kx9utbhK9l7KDsT+Htnu9P4N3Nz2h5dlH448f8Ey/Pg
	 5MXhwIwzBbU2je0istVhKxA2GvdGzufRkrKr5qnJp1omOwvmzlmcg+tNL0WKe20ooy
	 9WkzxQCFsfDjv7cVHW0lOcavEN4wNDJcRxrvDj7oA30dWZY98J8rFInTHASzaXLK4V
	 Z62noRUdR5tg1vfTYNoBAZFJgOp5+GuhoerUcXE7Xae6bHQnogiiM3NDDZNl3VhLDt
	 Mz99XuQLvffY+wk32RTLa5byQHLEl+rFOaFcHN+Kgo8GUXafqe+QIo9GbkLZE2Y/uP
	 qPK3+VxvebGRg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3D2C24C1A1;
	Sun, 22 Nov 2026 19:07:48 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 23 Nov 2026 00:37:47 +0530
Subject: [PATCH v4 02/11] soc: qcom: socinfo: Add SM8845 SoC ID
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
Message-Id: <20261123-molokai-soc-v4-2-851e5a9f4878@yahoo.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795374466; l=742;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=IRJIefuMwJxDPdNxVL+f0fcPDYIY2lpI0UcMgrvWU7E=;
 b=p1YxIzPM5m4V8Kk9cS0E8ZQUWwjjzXwxE+1Ez9Z6j+Czv2YiEzPK4WctlZ6U3fEJdsp8yCjJM
 1fT/2yqUb/wCBgceJdW4CYxsInqUb24H1MpKG36r3ilJqO8jlLkthZ4
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


