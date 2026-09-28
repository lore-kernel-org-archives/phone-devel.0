Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15974D4879
	for <phone-devel@vger.kernel.org>; Mon, 28 Sep 2026 13:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790603871; cv=pass; b=WfEJndLXr+uaLkeCHfLhN0ibeZROU17VBHpjFLlsB7oLxZznvBbMopks7Xm2bFnC/6UeHny+l/3h0ZsoOrG1YgQMGbehSz3C45iJE2+Gtud6E/B8m2y2KKO2KS5xG5XwYNVGojRTe4T0/VWjWUUK4Y0Igy4s57xqRN/ZuefJnBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790603871; c=relaxed/simple;
	bh=N0apPBi5a5rdeR6XkE9u3uUSLlm4uI9nB9Kynheh+l0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LegwDX715uxy7kG3styXTssGHZpG2I/ezztr5G0bawYNmDt2WsKwH7RU/atwsugl7aDAfBij3K7scPyuukFHWsC4RKKmygMTkMi49PTPG2yOkv0H6CYdFPxNRZ9l7Fxv1oNFKlUMfY3m0MtBqV1UQ+hbGYfa8C2/2snEj1QMt4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z4tRZgHZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gZm+5Tke; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z4tRZgHZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gZm+5Tke"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBACRK1433783
	for <phone-devel@vger.kernel.org>; Mon, 28 Sep 2026 13:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KNeJ1ZSGtxogqYjubG/I2m2j0TylLASWTRkIlPxaG/Y=; b=Z4tRZgHZskb8ptT5
	TWLgXlXd5ZEfOMXoSIMOXv3xiSCfmZPrN/BXEN2Jx/EI7xgxsl/mhtg23qiOqhBr
	lotZeIr931hrlSEd5cQ/+wfndIUB7MMIEPhy0N4qQaoL3vx0QDP3gKzGCBMkjA4K
	qZEViEARpzKBw/bZJdJ6k6fM60UXmpX36/eFY3dIVjAN/AFSwPSLBAOzinZyFOZG
	8mAxM8Svcg16uWsn2JDQlVfu7pS1jD7EKG1O73xL6IcpK9DHPvN80Fj2n8ZkDcIH
	gzgCPX/52m/fh2UgSttxIDJ4qB8q8S1LQf9euuiVEAdLjZcrqYl5RVZOicTCxXKu
	X1l8WA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj2s1th9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 28 Sep 2026 13:57:48 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8688139460bso2385343b3a.0
        for <phone-devel@vger.kernel.org>; Mon, 28 Sep 2026 06:57:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790603868; cv=none;
        d=google.com; s=arc-20260327;
        b=bcuHRKLrs45vNCKSI9SNSRavUzcVHOYsL5NcMpDdyogebJYRhFCOz1kfPgcm5nNs5I
         m4ipxaZtqLD4WNIj7FfQk/bzZh41N5J1j+6XfrS7GVr26/GlexJjt/nG4KRp45mdrpaf
         hyuQozHbyeDsUg22uLU3I0kWOM5DHuWiR0fWU37kP2T4ONHgmjVZgh+KxvGsrcNnXG6B
         FaHJ4FIzfnT8sXGLkcWFsXkvvDpxx1YTH4C0nqkumqu/1u+4cRwwNIVdOkRr9RkVdO1K
         dRGwRcoDcUZW8pO+RTHMzPIV9mkfj092TU6RHG580syH9Vbis6jUwQ5PRMHU2Y/phzyA
         0zXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KNeJ1ZSGtxogqYjubG/I2m2j0TylLASWTRkIlPxaG/Y=;
        fh=3MnYcx8GHRAIIlOn3mvsL3yzsV7JrpfyRupXr+OKcaQ=;
        b=KSQnZym5H92c9f6h3lc7kkOxoW7dfTE16vcXvYP4mDosZGvxfbhXYkMRvU0SbB3Abs
         3/WB1znJvB5nMW4kKtLq8/j49HEeAxSB5x27UQEnM08ixnmvFUNX70L0SD1/gnbHmmbU
         /7mTUFW6WTjJ+gA0XvaDQVyLi44zlfR/bnUNgtBb2+A+4P9NURJvGVjQSu6rVvO4BxPE
         aTd0fHozZuBSqdI9GhAchy2fDeWwmiUnnDr2n48e8yBUfUCBGKeNQ4merpjYIVWKhqDu
         FFnzNAPbMa8hZgxEgn9+kIagGRuAM3rOn4hrJJRtV4qT2c3zpuiws67+4gPDamn9NXyX
         57lg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790603868; x=1791208668; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KNeJ1ZSGtxogqYjubG/I2m2j0TylLASWTRkIlPxaG/Y=;
        b=gZm+5TkeNiuNCWoMFmByiGuXPWyeZfYVqr2uIkJNz73oKjT5kMP3a1/PLCH20oeLe0
         xcvk9SuiHU33LZ55Fbzpfxo1NFE/GBDg/vuoWelGhue22jmQ8AZDU0QRjzBVyuk62/HK
         pohM2L7obX8b66ghXXB9PSYRPQlEfxawvn88RDeEYywCxhFFV4rkCqwxuRdiC8P5I24e
         wA+SBuii5pGi4MhJHWIoXYSph59G0Q0iayJbv5z+vVNVBDBVkY21N9yu1IDSzYOFOi1j
         XrXt2aO9RGNzSTW5/ek7Wg9xq+o+xZaDAI6G3NrmZIDngCZvK9zlDMcXh3IiziXH73n2
         ybxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790603868; x=1791208668;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KNeJ1ZSGtxogqYjubG/I2m2j0TylLASWTRkIlPxaG/Y=;
        b=H/04/x0xCE0XxWFzH7KP/339Z+FgGVse2JeEHOC6ablYBT4ltEHaiGz49NNLzJeXBv
         4kQml96bv9FJ6fibqVhlTBECxFTemN4V8cOdlgkzT1iKIiS17nRYmo8pF6gOZAVo4zud
         I0v/gtxDVouoTOyiVKPt9XSzYr2RdncXXORxJT81auCS6yNnyYYsX1XZTCEFNQmlWVpH
         SWsBCuv3oRxOofm4DbifGR/25qx45tvwhg4dPUpgL8me8x6mJMs01C8BVUQ7CvKyYB4G
         W9Ys9HjQbLGBIf8LlvJ87qtPi5DWu4CdFJeiZ0rpuA5aZg1aMbv3HMjGwY0U8mKZNv7I
         W8ag==
X-Forwarded-Encrypted: i=1; AKwUvBxkETji+efLbGYwKSa95hCzDqnwR+HwVhjZtC/25nRcbShX/8SWXx1idp6bMQ2734FPaileMcfSpeuLtw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJFeIL//Cr1CDHCSGE8cFuood5u/WcCmQ/ogZAPReSwcKU0mEQD
	m066gPgAyPTCqdxjjElGmb3Vkary7t40lUFKDJrwOnyuS6WyORa5PNHafCod5d0pFuEZrkq3kdF
	ZfS9zF2Uqe92NVEtEjnB/whMNBupRlAqS7WAP1w3v83Xg0YWJuG513RARDLIKAMmKKXaaHQWbwg
	uyrD0J5wI45JmWquOMwJ57EbfDp7ZKKht2JjeB01re
X-Gm-Gg: AYBFou2UZAieWoIcdx6S6ZPinfAweIXAH2HYZTl7LMUGZey6MB/afweaGee5eiXh0da
	FXi2jJg77IeyuRjn8oHCoT4ptZeI3QbWsIdwREBQnAQfrCzVuL7fBuEn3g4hLxxXv21XcV0M2eU
	MNv5aL7t249b6qxYVOGBSP07COXgSy2jXuI6aFQ+3ZTMdDKqOB4xRed34epQ==
X-Received: by 2002:a05:6a00:950f:b0:881:c881:96e8 with SMTP id d2e1a72fcca58-881c8819a45mr4006756b3a.23.1790603868161;
        Mon, 28 Sep 2026 06:57:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:950f:b0:881:c881:96e8 with SMTP id
 d2e1a72fcca58-881c8819a45mr4006707b3a.23.1790603867726; Mon, 28 Sep 2026
 06:57:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921-msm8952-initial-support-v3-0-b96fd3fe298b@mainlining.org>
 <20260921-msm8952-initial-support-v3-4-b96fd3fe298b@mainlining.org>
In-Reply-To: <20260921-msm8952-initial-support-v3-4-b96fd3fe298b@mainlining.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 15:57:35 +0200
X-Gm-Features: AclHuK-nE9h16BssbY-0V-0Lcqrz78yNjoqqCVRnCD5BWpC1wzqbo2Hd-T05VXY
Message-ID: <CAPx+jO9Vj=42dHEwLzTHe1b+nrvip+ibVv4iPquxwJKbFAkm=A@mail.gmail.com>
Subject: Re: [PATCH v3 04/19] dt-bindings: power: rpmpd: Add MSM8952 power domains
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1NSBTYWx0ZWRfX2K48+GSLSR0t
 63W7s4Hh6YSWc+JnQgCNQQOVZGC9JEP6mR9QTu+KCGgzQNBS/Z6yQvC8COvYB0EWPBCrBAKSxlG
 PIxrawkPPcHi70OBvqsjHlgeFWcXq1g1CCQxJ8s9335PdJModLETyieEQfMEzl7WrB26/FQHqwB
 ZZ9aznXA0jTHqWJFXlBRMzWKF5V9/JgucDeE3iK0y9RyN19dEXjdWdQA5wktYVdEypG7oVspqXq
 In7TtscL/G7WJNXiC1op7yP+pH9Q0Hcv9Ya+5rIDsK2olpLGY7rFpmsee082o+BomrYw1ovOhs/
 0zbAH4NYF82uO+TxSHbr90yOs8axMB/0CIpxV2g+pC028rsSGw39BIhxwuG8bt5SFu6rW5xt7ew
 3KXKmZPxx1QwP/cpezqBwD1SNRSK3nxpxCQHovxahnxBAGcNwOEJex01F8fUB2cMg++bxWG2vD0
 tjA+NX/3I4Vro1Vo+5g==
X-Proofpoint-ORIG-GUID: -zIEPVNwtvuI_nR7Muauv4fWqlNTDN2i
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1NSBTYWx0ZWRfX/DvWXu76LFJz
 Sx2jjKr+8n7N65aZVoFTG70z9cSKOuVm3Rxcs9OV7KMYmMytnG+qKz/n8hqegDcI8hKN2dXu7eh
 2mIxDOdirfPVdA4s0O8lDKh1KS6mYxc=
X-Proofpoint-GUID: -zIEPVNwtvuI_nR7Muauv4fWqlNTDN2i
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6aba725c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=OuZLqq7tAAAA:8
 a=xo1k5ONJVskqAlz3UKAA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1011 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280055

On Mon, Sep 21, 2026 at 8:19=E2=80=AFPM Muzaffer Kadir via B4 Relay
<devnull+muzafferkadir.mainlining.org@kernel.org> wrote:
>
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
>
> Document the compatible for the rpmpd found on MSM8952.
>
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Do=
cumentation/devicetree/bindings/power/qcom,rpmpd.yaml
> index a70bfacbc5d1..8ee1c25a7c9d 100644
> --- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> @@ -76,6 +76,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,msm8937-rpmpd
> +              - qcom,msm8952-rpmpd
>            - const: qcom,msm8917-rpmpd
>        - items:
>            - enum:
>
> --
> 2.55.0
>
>
