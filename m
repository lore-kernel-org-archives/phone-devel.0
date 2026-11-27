Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795804784;
	b=RJOiSg1jR+uEfhURzmM71vAlK2ONBykeW8XDoBu7J0JX89azk6xdsL4dDpTEEYk8dtyP
	 hVb2G5tr2XCBC3wfLcLLOxCC+5VX97WB3J+stVC6u3H0aNb7Ud1N1gIKxKh6361Wmxlma
	 t759/EylUdaQr7H7CSJqSnAKfrMvK6OGkX9GRYc0+sZ6/Gbdtt79MnOfDhgDfDnLhL+Rb
	 n9lwCcsN+qSreSfi06uO8iSoexsoPxalvA4KJOC45a1ZVD5rfH4H2NdZ9oACtGQDrKW6p
	 MLR82Ig2yjvz8zxQVD8wrLcQwveJF7RO30LtYPJ9qGcjx86+UWNyMoE6KfYqq+GdTMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804784;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=NXUaTp9bYrQ3qJpc2M62MfPuOfqjrnX+68f1OJ6btRs=;
	b=CcfOuuWOcAPxTP1Ij67bQcMlwnTH7BX3/4uysoKmTzRqUpq+FD6vF4qcnSS+1wtt+ERS
	 WCDqBb0hw5iYAwrizSPVo15KGpMaItoBRUVNHmyM+WT1Ir79X1oCB/GcVQVTg1E/Q9nIi
	 CLtwCl5t9InXBZHll+ZTEGZVOnG05cN40Z2vHycH5UGmObtPoHhVjSC5Doohbf+PvZf5f
	 WrhHscLaB/ndzhLifrnxMWy6cdIMeH7z6BjOYDd5k/GXBFimm4eYudHQJU5eQE/EqnzPk
	 PWCsqW4Dl45B7ZEa5OzeLMuIFPMbMO0u6a9tbal5oX9wqCQuGsTYpOARsq1WyIGYKng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n9suX2cS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322A260A3816;
	Fri, 27 Nov 2026 18:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n9suX2cS
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795804783;
	b=gblWWSAw5vAr2OKDVwb9YqraD3WMHpv+wFIWM2VBKLH7Mldi7dlM+KJZXNJqpDQxurSF
	 PDPwM16b6FCpxhPJzmhzbbVxUwNxcxJBZmGs1YT/ABoecEJJU1shGDD6DbBp+odOPs6db
	 YHysSvoTcsefdh2KnRp9jNWpvGsunxIr7zsOofPIseU0JpjRLAPn2yrGPvxmhmmzfQ3XF
	 hg3P77JRjkQGypu2nxhmI+E7Waz/TKc1724ekZtqOKzlQk585ae13qy/ytQfoVc6zhr6I
	 2izKDHsvILvQDh8S9JpG1ubo9cYeo+FIPXzOMZ10wxDKfsMarulFICXdZ5W2B+Z8Zpw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795804783;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=NXUaTp9bYrQ3qJpc2M62MfPuOfqjrnX+68f1OJ6btRs=;
	b=Nn98rsx9Y3eI0tphOREm2frHCWBGczKaYrZJDTODFx5Dr9/FQchOg8wac+eRSu8f//Qb
	 zvMXv5jr5RnrKACjIxvv3XpLvQa2fK5TiNeIcoBXtMOkUUUAcEqYUw2xy9y5S8BWAIzuO
	 A95OBVvveRXlYG28CSpuDz5jmLDz0guGyBOFgRoy4GCLoC0hAJRzTV1x24U6gIgJU7sQE
	 ta4hHyWRm8ar/W4zwefk6QBlJT9DQEV/Jh7Ar84EfTdXBxPaKoy190dCmYq73V272jcW2
	 O1t0hClTWxkBEbFU5er57jVVi8y3h/NqpW5al0AiPS/T8gXExHSVXedSNVLRn/6WCkQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 540D01F0089C;
	Fri, 27 Nov 2026 18:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795804783;
	bh=NXUaTp9bYrQ3qJpc2M62MfPuOfqjrnX+68f1OJ6btRs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=n9suX2cSAeIi9bvB7f1xKGrzIDoIn0H7LuxEy9FdE387JCV99NAmfZYAlgRbZWq90
	 hZOzS/WfkG1ioQGtkWE5PRWYKkZvjU/DGtuMmtWwADaVs5EwTlNkR0o9+DCBcvvxbG
	 Fqc8sEUHdIL5ih/r70936Zm6/l3n6PdTA7kgxs/DO71CvJbsp85t/cQqj3gCi8VeIe
	 egVyZ1yL1jvKMlpQjUhQj+sK0dDbQUCnmd7A6OK5Rk/czrfIjfqiSd92RTzmvOZL0p
	 ZB0V8xMO4ghpe4zsqr65axrutyns0WdfwVc/tEvl+EZv5tlPqSAH0Xc+Z0L6Khk6aC
	 Ys+juNNeZyIvQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 534364DD43;
	Fri, 27 Nov 2026 18:39:25 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Sat, 28 Nov 2026 00:09:27 +0530
Subject: [PATCH v5 07/11] dt-bindings: arm: qcom: Document Molokai and the
 Motorola Signature
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
Message-Id: <20261128-molokai-soc-v5-7-144801dfad7f@yahoo.com>
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
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795804762; l=883;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=EMR0bzongKtYLt4CKK8C1JzDACXZlOzy7AkZudtfYqk=;
 b=jnAtDOllGON+vnbBemjhgU2LP7G+Mk9FM/6muYEMMyoPcxKkReyBUQFLaFV64cFRMwQnYkIfu
 IbNCr03AqEzBTFkf894xxB1ot+YFhWS226p0ye6vRxuxbQi72pv0JCI
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

Document the Qualcomm Molokai (SM8845) SoC and the Motorola Signature
(vantage) phone based on it.

Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 7ffa4f69987f..6993bbffef9e 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -241,6 +241,11 @@ properties:
               - nothing,asteroids
           - const: qcom,milos
 
+      - items:
+          - enum:
+              - motorola,vantage
+          - const: qcom,molokai
+
       - items:
           - enum:
               - microsoft,dempsey

-- 
2.56.1


