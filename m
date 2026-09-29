Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C004C52BE57
	for <phone-devel@vger.kernel.org>; Tue, 29 Sep 2026 13:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688871; cv=pass; b=HvY8NuHQsKBrNJ33G3FiT2D3aK6O1iwtmcGZxAaT/ByYTSBO5A5AxhWG+NCU5TFe0jBrKcfR9enegLdsSNG3dYo6A4uC8ieYFMuqn9DZY3l38Dxd1WIJE0Bkv0BX4vgKJgb8GisPape05BoN5dUMgi3YxgUO72uIM4Qs66xUSws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688871; c=relaxed/simple;
	bh=aatIQCpb5b6E18tOT607YiK+lREgF4JTQbKPFrO+iVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LBQB6ubOErzCiNPnC+yXzxVCFmZA6/lf0BGsVMITOY5hoKfv3Xc35rhvTlKSfNuwTG70HguQ0gbin/NvJSLf90m2ffS3aLPFFREbMsTBaOW5hjN24cMMXPoOajwS2A+V9LCbrXnGWAvWaZSiNsN02e7n2MMSmjmUYwT4jWmptwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hk6mvLlV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MnW5UteW; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hk6mvLlV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MnW5UteW"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqegD1016876
	for <phone-devel@vger.kernel.org>; Tue, 29 Sep 2026 13:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ApZtp9mCDzFhUghEqNRHfpNQRpHQIPz3H5GND00+/Q8=; b=hk6mvLlVWv66MepN
	iXjqUBQgGPOer5qnBJte12x4wjPvxOCEYL7J06CYjn0EHwKp/mQIZhzGf/7PTCrr
	JPVMRa5P31yNjd0syZbjgMb1SqSQl0EhM88wLqYun1EFTHMdFhjcUQaYctLQJvLB
	m8rrLNP8N82Uo9R+rz0dot2NO2Ag+BRrRZy3QHNaATzsOSBlDlmyQoF67xxVYAwr
	6AvhbgJpiztMCqAaEVjfmc1yrAp8Qnex8FnEzTZH2Oi00Q9D6r5JmaAxiFebRClG
	r3l0ApPic+NoNoV0+qGAVh5h3Rn6Nx3BILxnO83SaAFd/J++STdI9TWC1odBWbQy
	41skTw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h05yxj863-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 29 Sep 2026 13:34:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39de4e72b33so7789628a91.2
        for <phone-devel@vger.kernel.org>; Tue, 29 Sep 2026 06:34:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790688867; cv=none;
        d=google.com; s=arc-20260327;
        b=XmoE8xoClNLXB50P7LcSwVdEGXArAu+Lj01rI3pJTRvL2dT1bTSYE004899OedLTLq
         ZnM4vMCTMFXDyW8RKn4E/LGWnSsE7Jz9Nhy0fUkBAlTGH2tQLfXLBgrrv2F0qw6nOsIA
         u/er6Ajh6XQeAjHsR5h4ONdAjEY8h3UPMt7NueVz3QMOBHIBdgJGkapa2Xm/UiW6obb0
         +KSfACUnydjVyMQdYoOs2+M3LL53u/Mdc0fLn6lVPamm3Z1peHi9dDlBl8Iq6S1N5qO2
         mtsbLpPTrszw0Lk0XGGYLJ33XNx+O7qVF47e05cd3Ud1/BbJaBO1W0ZzyrgrnGBM355l
         PxAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ApZtp9mCDzFhUghEqNRHfpNQRpHQIPz3H5GND00+/Q8=;
        fh=JlA1zaUf6tchuq+n3w2YyPuckvVBV4TID9PzV/bRXuQ=;
        b=T7cUt5u3wJFsI3CHJqnqmHu96iDJvRy+lJssr1xcnJhflqXIXCbpfjk87i8mPZ1sVQ
         RhDFw3vbd9O6IDAyIc6T2rOgpnyHaAZsLLZAuKg+nSehyaH3NMlHs//JdgO3ElEQUcYc
         PNT4bxDWgQYqjwM+2feO3Owk0YVzedDmA1xmK7xTCkzwRflx/PJcJ/D+8ysqVFkE/yOn
         P0jv1dETCeb9utoWmIo/p5KDQ+xXGPG+p89KJg6wT8aUFJ1ir4Ur776aE7dVxnFjsgjV
         PHdcngi1yyfl6p52X7IJkNM5NvRdwCXC5WfMdxIGhKnL6vCs1nSMj9gfyi9iTB0Je0As
         0YrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790688867; x=1791293667; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ApZtp9mCDzFhUghEqNRHfpNQRpHQIPz3H5GND00+/Q8=;
        b=MnW5UteW5tCkE0domqFe0WMEddVoAo24BrHbfCGicKqHJ7zswfoA07vSpvD8NfqOnE
         fF8ELmym2xBwXyl8/OfGKwGsoqqQxQokZj3gd+Dq32ZPO3DRhsUh73z2LfN2tdHpGy/H
         EPBeds6ekZJPCl8GDtF9YdK/apasEgcCZd5m+U8eKxUnzX94w6I8HytVWl5AvvjGs3zR
         DpK+qksSdODDf/RHW+WZU/BkBWAdIHCAI/QR4tzPiMQzi530jEw/yRRLhlCn3CDzzxlv
         lqWsAjIxiU5+U2yWw0xsJgp1V2E0KCF+z32vgJSxHnU3S1tTCcTS6PAXS2gHKiJQLrhb
         2M1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790688867; x=1791293667;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ApZtp9mCDzFhUghEqNRHfpNQRpHQIPz3H5GND00+/Q8=;
        b=CXC8iSNH5DGvDrs8a61130cocyPX1ZK8oNLViQ3NdjLnkErtmwx2JmNq8J6kkYQcbQ
         frP7aRbLzEzWKZvYvTqsa+tpgxfRBZtQY6M9DOiLwf5ZMINnHGSDxmXJyJCyAhg9sJiu
         SdONAfgWwQJtqsHVJn/fsH2qH47qqGFn5/pO7z+g74y9Khin2LcB8JJSi2yL75kPOc38
         eJXRQ1Ph8lfoMaUpiA4gnlKVIacfi/zMrsLuvSygx9qZ5Ge6LvchTHhuIyHtq1yqt7yg
         UUC7pi5ySMnEnym0mKuo6FFX4XMvAKKnH5YCNEJMPPRXy6kI5R9OfYwORdsPKWQa6oP5
         gpCw==
X-Forwarded-Encrypted: i=1; AKwUvBxiBRz89Yt0JtvtLvRZxfo0vEKGd+ZOoygDY8O2L+2zQXDV55XJZaEP1v/+P0XOjN6WvIpftGecKtO4gw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLjQnhgQYEHEkOx0Lcda7FvY9QaQjolAMn/YCL96A62FLuB2Ktw
	tdTyrXIRnjRiqnI4VOEImdd5vj7VL4bRlIFrAVW6KKqye96NoZQVEvk1WCl19UeRqGx6Mv666Gp
	Xj5ad5sbGZMabJBVhyo4h7QTlS3PZ3WErBsZW44vJ8gcLzAdVLD9McCa9l1HOAfAnD7ic2lNhhI
	rJZGuoAg0+EbAASprowL61HbKIH4Ua8Uf654lYDbiF
X-Gm-Gg: AYBFou2NFjTaa91HxcNkiCILeSRcGdJmOg/lF76GUe+1m9T3sb8qszHrmt/1YrH4Re8
	txR+Lybqde6m+fCqxU6uMbRqY3yZ9trYGuwC7XIkVcLYJ0jp1qgWkgdGQOE6I9J+jAlM/6Y65N+
	RY+Kauo7rejy5Ao1DDHpgzh1zbqa9eYjh4rN7lo3LrT6M0X63ufzXXJnTG0g==
X-Received: by 2002:a17:90b:2b8c:b0:3a0:574f:5854 with SMTP id 98e67ed59e1d1-3a0bb60e74cmr11071557a91.39.1790688867369;
        Tue, 29 Sep 2026 06:34:27 -0700 (PDT)
X-Received: by 2002:a17:90b:2b8c:b0:3a0:574f:5854 with SMTP id
 98e67ed59e1d1-3a0bb60e74cmr11071507a91.39.1790688866886; Tue, 29 Sep 2026
 06:34:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921-msm8952-initial-support-v3-0-b96fd3fe298b@mainlining.org>
 <20260921-msm8952-initial-support-v3-5-b96fd3fe298b@mainlining.org>
In-Reply-To: <20260921-msm8952-initial-support-v3-5-b96fd3fe298b@mainlining.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 15:34:16 +0200
X-Gm-Features: AclHuK_IsoMVZ8jA--KFIskLK5LDOvw3Q0lyiLyhAEn2l6B1awM5w3Hl8Ax8gbg
Message-ID: <CAPx+jO9qPRgae_VqWrGQ8bhDOHBf+zDzw3A-BxCMa25XfPaa7Q@mail.gmail.com>
Subject: Re: [PATCH v3 05/19] dt-bindings: mmc: sdhci-msm: Add MSM8952 compatible
To: muzafferkadir@mainlining.org
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Lee Jones <lee@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, iommu@lists.linux.dev, mfd@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1NCBTYWx0ZWRfXxj8A4dE8CHiA
 qwAhWkKwzCIX1L/rS1k9CggCWztDUQBDUeCNf6gJJ2uqCn+05JrhT2xT4JaaRutH6w86htWRWwD
 L4e2F3aMCBS4y4IpGgTwMaMSaY7D20w=
X-Proofpoint-GUID: LYGDA4hCCddjjMynxAhrArO8Sievw6zl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1NCBTYWx0ZWRfX3DqbaMefBPid
 aTRCTv9Wv4y/l4vopnDiQJHftSMPx+ITYE+udVQ3KxQOa5jNgs+VAwlhtJeocGQ4iV4+WhVDcZk
 I8bNcdhvYDPPix4+Dvuc0e7CzAXg8M912eq4oJiGMeEVqG0vFfiNJLuq/QoIL69FRHNOR6UPygk
 2iQ3dhT1RnRwWR6aeysaQZqIZ8izCTOymnFQLG4+yr/5QWMy8LRIGCawAbCCMXBwzMp7MGV3uLB
 IVGxerm5TaSXCFQbIgDFRqxk6iIbDeMybLjsyPtb/K2F6Db5DSN+a5WJdZN9SIs7HFyX2y0DoJb
 eF2D7v2/0v5O3GQRDdNCWHdRcQWY748vR28QvfJ9A5+gGJ+lvYqMWrhWjr+vpPJf18qrroitmRc
 JSXyOVkl3vo8oyKOnhmj25ZHDmeRcsSVMSeyewgFjjbu79tJyeKG3VZUq8O0hOuyV6umDQEl/Ey
 nCeOA+Ipk5GfmBIKaHA==
X-Proofpoint-ORIG-GUID: LYGDA4hCCddjjMynxAhrArO8Sievw6zl
X-Authority-Analysis: v=2.4 cv=SaFi5fRu c=1 sm=1 tr=0 ts=6abbbe64 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=OuZLqq7tAAAA:8
 a=wO7LUizMVtHDz2nkp9wA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290054

On Mon, Sep 21, 2026 at 8:19=E2=80=AFPM Muzaffer Kadir via B4 Relay
<devnull+muzafferkadir.mainlining.org@kernel.org> wrote:
>
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
>
> Document the compatible string for the SDHCI controller on the
> MSM8952 platform.
>
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml b/=
Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
> index 69bd44e65ad7..9d4409c958fa 100644
> --- a/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
> @@ -26,6 +26,7 @@ properties:
>                - qcom,ipq4019-sdhci
>                - qcom,ipq8074-sdhci
>                - qcom,msm8226-sdhci
> +              - qcom,msm8952-sdhci
>                - qcom,msm8953-sdhci
>                - qcom,msm8974-sdhci
>                - qcom,msm8976-sdhci
>
> --
> 2.55.0
>
>
