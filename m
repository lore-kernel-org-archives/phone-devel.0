Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795189971;
	b=ghJPSNXQV8nWxrQbBHnxMpxDwZIBPdagq6DgEFsCemrdsiRaEnDLNwCGkZryl91iToYl
	 lgYb4ETDs4dyItt9JjpxYUoQlQRNv4QolgjtDWss5pJYjmcG6lIUpA11Em55pcO60TG+e
	 8TYwpRuAo01Lj+H4Nneg0p9R7d/pMoMPrIc9DT/ayE9d+9S17kidDpnYB/jcSKL8W1CIs
	 G4IdOIlin/UBPgrpp6XDzmPllZ5NQmUA8v1Ee+NIBUAhOeAxQcCuUaH9wZ8HJqqGT0Fz4
	 c2lM/52vUMeDSnnYDHtipgn2OEs3p0UidQUT/db1vV4MIjlUgpiHy6lS9pImZeen67g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795189971;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+99cmFsfXOULQ9f90LxW+hyZsbOUVRXMjmKn92M1d3M=;
	b=gLbYBOzjRvmJvmDt5hF5rh5wNQIm+T0kSADD4/BLi8m5lqg3wVySyHuDygYi7rKBaywe
	 0O6SOeGu8v5eC+/BauJ3/Bm9d+Xm0acemLiqSLtLFyEfyGzhv+ftMj45Mz/TPuvC0HswV
	 gWMRSBwBc1VhaxcG1oc6bbUMp5iJLwVUrra8LEOOtsr6F5PbBeQO5Lc7GwdFGN7v1vVBQ
	 Dmn1nj07B3Z0A0jEoPE0dSSPwUznziQE1Qjhy1g85r9IdfYXvC34RET3CV1GNYvNBmzVs
	 TboffvVWlRZ9a8MvvYxhJAFvHfc5WUK6X7VWrz0ZlCPdx2cGsOBOsHx/BdBJfdGohAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jcQsY203;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C9E60A2602;
	Fri, 20 Nov 2026 15:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jcQsY203
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795189970;
	b=nlPnMBO3A24Z10DDTDIia+DXYJok69ljkoj8BEZBsenXO9FoT+PJsmsUEqaVkFM2p34z
	 s4EjT04dgOqrAyFUjsWcVLOjx4DyrtkznjS9hYdLN2yBmrLPLZW1OLnpltraTJ89xYKFy
	 Z6pVBB5eXjn8DJhu4u8dSGnopzQZoC4o7Q1Noc2w0jfw9+E44JsmjvrzpXww5m+QtYyXf
	 okJuBTvmrb7RkFHJYmIlMA7AJfUC2ZbeFnWLg/RZc5MVu3Fnt3Unk69v44ZbOUxZMiTWe
	 SAtj/1nZzDgs12w6LDwExlrAsFEMyoM60N+bfj1yU8N5E9uZrVngJwDBNc2N1RJJ0ew==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795189970;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+99cmFsfXOULQ9f90LxW+hyZsbOUVRXMjmKn92M1d3M=;
	b=xDkgGUuAnFLpORZ/5nT14TTFoRdzgzKr5caMK69VtDvup4wcCpfxmkNnfVD4MzhJL1zM
	 NNzCj59Lf2lQ4Jdwpf3vtQ3musl1A3YPTNDHSK+L3xWys2Got/AQ43IAtcwbW3GRTm2Jb
	 G7AGJld3+peGjqdJ8tc4fUCuVfT1ZoAmsJBl24h4VWTBDbDpC5+0MzoIB1jALBZM731xt
	 m/reZnj6Yvl4gjYUsJlrli0ntMP5qDtIfV3m5/5XBiaDqAG6fbuUg/5JVYDHCyULaMTH/
	 5Smg0kaBRBb2oBUb2m7f3bSrvRVpftM4TXyD/UWYaCigropuyjjR/0ed0IHXFqiqudg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2FEFA1F000EC;
	Fri, 20 Nov 2026 15:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795189970;
	bh=+99cmFsfXOULQ9f90LxW+hyZsbOUVRXMjmKn92M1d3M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=jcQsY203WZzJ4Uc5wjeDeevGqTkI51zJKeynkS+t8/U7QV+Ds2fBi/3RRQfyWqdEH
	 dCZHGh0WFEMVy079neVWxvzel574MdeihaAbzpukGKb1d5Dn6YTmwAGnZTB2pQGOyB
	 6h0f6ren3x8CcWB5/+Kwmg0FP1S/8xE+FbW4Nw9vepwCidX6GkQqg0AkNlhsfV/nib
	 DrC7Deum7Idb0aEVLqK0Db9fBtWSG8pYYsD/pkOK03r66v51f+uhqg05w/DLgGroNo
	 /5u4XxcEvaijx6V/rVgjY9Midko0HmYGyZOKuuHUiPgazB1Q2+rwtsRnohkALNIyd+
	 td1A2an/1kAhg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D259049927;
	Fri, 20 Nov 2026 15:52:37 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Fri, 20 Nov 2026 21:22:37 +0530
Subject: [PATCH v2 1/2] dt-bindings: display/msm/gmu: Document Adreno 829
 GMU
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
Message-Id: <20261120-molokai-a829-v2-1-c63c268d5ab3@yahoo.com>
References: <20261120-molokai-a829-v2-0-c63c268d5ab3@yahoo.com>
In-Reply-To: <20261120-molokai-a829-v2-0-c63c268d5ab3@yahoo.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795189956; l=903;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=fWx8B8EVRHaa/QjmI//OdB1UeHRHRMAyCbcwF2whEXA=;
 b=1bTZmN2D/D8obhEtn5O3YNXSXlkGtc/C3KCjY52B9UBG1bJTa+MOLZDfgjP8rg2gPPzhmKicK
 E6DdQPy65G3BFBGBkSGOqDBeh6lcYwIRR9D1Habl8tBcXgepoa0ieEf
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

The GMU of the Adreno 829 found on the Qualcomm Molokai (SM8845) SoC uses
the same registers and clocks as the Adreno 840 one.

Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
 Documentation/devicetree/bindings/display/msm/gmu.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 07f0e547b43c..2599eca08a36 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -337,7 +337,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: qcom,adreno-gmu-840.1
+            enum:
+              - qcom,adreno-gmu-829.0
+              - qcom,adreno-gmu-840.1
     then:
       properties:
         reg:

-- 
2.56.1


