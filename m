Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795804777;
	b=38ljwAclb7pPHdxPeAUip3QrAtUDCaVLDphhpG/KXUmv0UMKDIhX9THPqaeXUqS3LNlf
	 zPH8cWcv8HFyLeTVcFLzldG++5dL8Xp05Z9RB0kI4OEk04QlCVoohtj7ooZFMjfa5nkY4
	 OwLx8elftRpWKx/Wj89I8AtEMLzuWFeYETtMw8kCI27BEW6fuSKGLY27qKWylY2xOP83M
	 6D0XMf7x91u5Y15R2hsoYLQojPpLzqILWGx6j/dkDYZa9tfrTNhJkKA6osyU0SYgR5P5O
	 K2oSWWgrAV2ZJeZsYD+l1um58UBLFsNtCs1JX40wzi43JbtzKs0yassxDH1MEMGfnQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804777;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4sD1ZkqiY2GZwKRYH85si4EbEJxtv2x2+CnSHPTE3I0=;
	b=qrP3IO7k4U57Z2dQInvMWtUUpgE77CdGgmsmMEdNSMWlPPNEx3ot8iUrJrILtvlSlLsB
	 Lb69hqPZ2hu5Qgnc765jscIqgbj4WyH1xanzvYxTLBJKgjeBYwnXR24MX39yo9Cwszl/W
	 6yhQnQOPMOZ58j4WbZ51VkcZbIml6h+gTR9RZFZi9XfqJHhXaEXqDKkQahRnqjJak2KRt
	 +V86GHzutQhOZEY/At4bC7cJi1nxgMHqoF5D/2cdo7HfMqYJOuWh5nyqJQLd5jjBQzfXN
	 IktLw9mqf3yqKzXKPBzg1Pi38bPC4BUMwUoH7UNBjTf58pK2rI29STkk3kbup6nWFDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iNqopRIP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38CF606A6A8;
	Fri, 27 Nov 2026 18:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iNqopRIP
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795804776;
	b=T6kM/31XxnHPCrTsRyaw2VUqlkwj7HCmgQvHBcLJWGYqoxd5RMpjHf2UG119xWtGbhV2
	 8BEvD7Is2EeNXbhvDFcUrDkeJchsrVpqr+DGKtOse3IgpkLdK+sOSRxs3lIxqM1iUz0d7
	 RG/w42hypPLI+qcXyUhB8J0vLtyiuKxxsPl6IAgwOYTXLSyvVpddGTjC0+NQFVetr4iCV
	 N7OnTzKNhXOAy7crn48fXBnXlKbCBKj7K4wVWkO8Dh5XaFd7CBQzwbHjhApU765xRxpmx
	 /pNR7H7Vp5IY8cOzRuulXxZcE8j12iBuGJ3KXmcZe9FESOqx1bqO77JhQu2bkMyJRXg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795804776;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4sD1ZkqiY2GZwKRYH85si4EbEJxtv2x2+CnSHPTE3I0=;
	b=rX/B/kFn+NCGqV6vmOfAOpo1EYnlorEugmhYwoAUxiDib3iCUeAzpfp3oRsWS+Peimdm
	 7d2iPYmuVLsrQRy+f1m6eWEwNxge3EVMktp16j0GNXjJn2iydS/de9F1nY/rk66BCnxK5
	 A6a3eaXg9VcTCtvDHWEaUTSZOwO41DxsvEMl1r8YkisVImbU63dviqBjIc2AbqIz7lVPL
	 JtfD7SmD0gd85xxmdOsyhr0FhFQgrTIfyH0AUfQhAsVz2FPtWTS1VuR0fejuAt70IWvUy
	 yflHijfNz0gDSdHbnM/Dd2qk7C6kvmSdVq87Pac6Pt6rmeeRVGpKXH11Oc969P022FA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 40CF71F0089F;
	Fri, 27 Nov 2026 18:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795804776;
	bh=4sD1ZkqiY2GZwKRYH85si4EbEJxtv2x2+CnSHPTE3I0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=iNqopRIPJgVMOiqZVIW+V897XNJpNWiuxA1utVfzCzEFKPElYh+zSoJcpb/XmCJ+K
	 w9HhRbts4Pb6VzmFyGZiXnlkYP1dhR05GeqoqMfeP4BUxFZqrxLVHM0qTrVh+6cnBX
	 lqevjw50WudpnIuUYiIL/M+0WiZ3mEmL7E4lYHo5j4KaWJh39kEJruaWuO9WkTS9vK
	 iabxZZzB5OoD4PtGJoItqMFJYgL+psr6ZryUCYQGbzlilc4Bj2F0Npve+4S2Etwy3J
	 DQVsIcX3NbPU8fhzOmbw2hmZjEuwEvYaI5SO9+1NB8XMXpvqMrDprcCkoJdhxRl8ud
	 m2hIbX7CN5TJQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C1B614DD33;
	Fri, 27 Nov 2026 18:39:24 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Sat, 28 Nov 2026 00:09:23 +0530
Subject: [PATCH v5 03/11] dt-bindings: interrupt-controller: qcom,pdc:
 Document Molokai PDC
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
Message-Id: <20261128-molokai-soc-v5-3-144801dfad7f@yahoo.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795804762; l=994;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=AtXYB47jpEkNJ5+VdRoyyGnPME6veYsNpY8wyZYc4r8=;
 b=/YghBFxFo22hA80zTV08iEOQ1Fp+D0q5+yLAS7pUKPRddRUw3V6wpPUUYXVYzYqw1WvsiPcmE
 Rl7OWGNUIoxA2b+1QaX5CCAVusPKhh4h97mi+EAFpX+GACHuIL0/7rc
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

Document the Power Domain Controller of the Qualcomm Molokai (SM8845) SoC,
which maps one more range of interrupts than the Kaanapali one.

Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8401d3b48e0f..64de63b7a031 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -33,6 +33,7 @@ properties:
           - qcom,kuno-pdc
           - qcom,maili-pdc
           - qcom,milos-pdc
+          - qcom,molokai-pdc
           - qcom,nord-pdc
           - qcom,qcs615-pdc
           - qcom,qcs8300-pdc

-- 
2.56.1


