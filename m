Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795190007;
	b=SZ0GBtFk54Fyg/GffZN448OS6u7xvjXtG/4zrUE0wmqqAty39g8v/EiK0YC36lrzT+pY
	 spMvyLcumMSy1tG5SLEZMhAMXmETKvST1Xpwzhpka5fbVahrhyivzSEKH2xpvjZM8OltQ
	 WXns3U16V4nek2Y/qOedetegEyhw7NGdVNux6MIYZRZFTMRVQJ+mxDfsMShzwcuY7T69P
	 sIf6BqMokAZaavDt7+2vbDEav8I4RHL2tx7l9nNplB27C1G4mRE7GwP2UJocx7bOXQ2Na
	 vhrwz0FMeZ9kophTd2JpE49nxNdty7qYqwqBfjXuUtBeqn7QAWEnY3lloPDZyT/DLNQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190007;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ZCoEBFwdt0hb6XJ0gsoDmvrj+vuMwKLfpmeLgpLKIxc=;
	b=s1abyoKnQqwn1rFlj30/p8LVVZi4RB4l67ilM7WlJEhbnWj4/IXAibGg3Tuy6dAA3/Va
	 7aqMN5QZdBGPtUhjGkCT9jjFWfbr04WR6zXt/9fSvLPxgsirn6MOT8d3N1fcg89CG+yUN
	 okvfzyZefQEhDM0a/p+W7KJ7s97HQCUtGgjI1xrASpcCs49XE/0lzjINpsGY6/JxVV/VN
	 PyMSR4vpcH8xXcxV7Q6BmDVN8XXrzpheDjIjX1DUrGyoSKxIJcytI8ckGwz3K2sVPnmNt
	 zSMMIggmeZzCwC6jo+lB8cszEOVY2+irfnn+nete1RRQUDXLGbn/ElUi7m+9/oRd8yw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FFNjkZOO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F94260A2605;
	Fri, 20 Nov 2026 15:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FFNjkZOO
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795190007;
	b=OI5MJ1vK85qWrCJo7G1ACuZzw/m/El/AkV+fSd40YK2/W9hJxDU0c87gp0KQ5wZatShS
	 QEG3cc5QVriT4SC7NeOdILpOWL8AAl3qYB70DXDjAABzwbuUukIxy/Yhz8G57RVwi8pL3
	 2XFLKBX0hANGZ2HwAEUy3NfCQPPtNbcXvCqxuv726//Xl3nfE/snTqmPkSmI4TLjO7p9S
	 r8hj2k4iPvZq4quaERlcyIquWF742v2ZH8jYHW+BD1bWD8dDw4fAbD2Mhwa6B0eZmWqd6
	 Ov6/Rv/zJeu5b2/Iv+YH5iS4BoSal2GBqWi19tJF3FO0EmcBbylXQyOQsaELXvJvOiA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795190007;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ZCoEBFwdt0hb6XJ0gsoDmvrj+vuMwKLfpmeLgpLKIxc=;
	b=UVXUtsCrIMd8oqdwlII7nCX+BAxmZFnR5XZ0FlzUviEfOZJTrBjbDxSKPJvUqmT3yxMc
	 hm5WDsX9pISsjJSCOGW2GImEqPKJYH1SDkbNzYnrXBAxofewysAbyOROUYgJf74Ufz0yL
	 I8A35g7ovBNV4KccjOG3Pe+blIAUnMGzalNE0ISoO5UhFNnnVDvxx4WHUf4ImFB3au7Bn
	 5XpI4uIftEQxCZ+2GIneERS4ds4aLB2CH/tKacGfSU2DX6XJ/s5w2jcPKP2FSQloDBOrJ
	 8+gZOz8pfgI3nO1j7BTWnSzPPgKz3jsk5K6t4UiwCYZFskDRRNnYN7znCstuLDoghaw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 26EFE1F0093C;
	Fri, 20 Nov 2026 15:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795190006;
	bh=ZCoEBFwdt0hb6XJ0gsoDmvrj+vuMwKLfpmeLgpLKIxc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=FFNjkZOOtC2fUMN3x4BQikYTG1X79YidIHk75+F1L5rux9OdCd/jTmQGHeeAW/ZFZ
	 c0jcN49X182+xOe+sFmGl9CS48gWhfiGcGgsT7j6nyzuBl51xDcg8LqIEtFmwKqokg
	 tCQRQc6EQ1yl5z2o/oZjL90R8F91pK9a9v6cZU8fcven8fYQvxFTOdY4fGC0Epk/8o
	 vMMRLsP9W7nWnACzw7lnjTi7hKbyLsnM5wI+TvwZY/uirSPU81kidk+3GUyBTjvBkm
	 cx48i4IIyGgM0CbBwa39czd42xiM0dphWTIX5jCUa8oEHxJsx6JMsg0B/m87ehMrtT
	 T5HNhVT0U0A+w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4ADB849942;
	Fri, 20 Nov 2026 15:53:05 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Fri, 20 Nov 2026 21:23:09 +0530
Subject: [PATCH v3 07/11] dt-bindings: arm: qcom: Document Molokai and the
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
Message-Id: <20261120-molokai-soc-v3-7-403d763685d9@yahoo.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795189983; l=831;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=vP3Rth4Xdo7PMRDMJk4bz4PlxggY7eSrhw2hP8+apn0=;
 b=ImJjXdaLDdbq3v3HdqIpoyE0N69ZqaC1Cz0OaZg8c5SuknKKmqAR55WdBrYWpbXruakB1qY1I
 lQWAei6fiOdCvngy/y7islIL9b6TUXjn+efBwvY1jUF0zlHlY6BghdA
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


