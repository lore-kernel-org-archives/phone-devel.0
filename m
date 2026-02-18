Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1494230B533
	for <phone-devel@vger.kernel.org>; Wed, 18 Feb 2026 08:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771404280; cv=none; b=DXg35DVmTOKhrgWAqqxnsjJztks6TvQ0FgW5lwgjmoDRLB2XZnFeCrwOCc4036UI8M1QnoHxX405UQ/t8Loe5B+DXDr1DjVyBr2sdkt+RI8NHI1W8hBy8Sx8OmmFTBFq6pwvyAYs+VS45uCOHOcXt0t3Mtueu6ZtamNeJW2ZEQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771404280; c=relaxed/simple;
	bh=ZWt45yH42sDKPvaNptuhnbtCXjsl75kDpLBkxKkK3/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ccfdNnyeq66uHZYGjZO3Ayt+8lYdWur7Nyg0KXbFkqwFKNAk54/34gtK8wf5dA1EOmZNuWFkDvyTvfyHX5qgJC8AoTHMESeDkNNLXzsKPtGW72ff0DJpTqG8XAWqCoD2xHCefURPbkQjAtGIvXDnrXh1tjp6skV1EJd5QsEPfHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gpFn/idK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TH9TuM+/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gpFn/idK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TH9TuM+/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I7lmgr1942831
	for <phone-devel@vger.kernel.org>; Wed, 18 Feb 2026 08:44:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4AGbJPnQwFvIJpxdlL3I9UAJ
	Z5tojgKAthjJExwJ3o0=; b=gpFn/idKggaBGEOlGCSvJgBX/yb9vG+qv3U02/Wk
	gP1kOYxh0dMP1S70/DN8MwJHVtdR/YOi5TsJoAZzvL7NVugMn9xAzv+aiwTyQLBq
	tfbf65/TpvqwM5lMU5omQUrSWI7UpKTKBFd9Jdvk8mP0ts+06vY3e1GclywsVrYt
	3GWOUa8Bp61yfbUSttmCqmEXYF8iiu9l8CnzsBhHtCu5APJGdc61mNLjRqTD09co
	52Z9ZeVtKX7dU/R7v7ILLBFxmWvDhNlhwAjnHkqAJ66ZGRi0OOE83j/ry3isF6pi
	nrysXgSz7YHopUjNO6scKb/HpZvqBXOS6YiWWyyPpcx5Rw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccq4g3ej5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 18 Feb 2026 08:44:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5033c483b76so415652391cf.1
        for <phone-devel@vger.kernel.org>; Wed, 18 Feb 2026 00:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771404277; x=1772009077; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4AGbJPnQwFvIJpxdlL3I9UAJZ5tojgKAthjJExwJ3o0=;
        b=TH9TuM+/eTOksLLdb3d+uFBZNi+NDgsuXJTSy2HToBhwygwYR31egp3VXQ7pVs1/4y
         rQgUtmjx3CdNEup71JB3Tshzwd/AxmWrT9UCa3LmiXVhyLCswJbxma8J0KTj5zEZwY1k
         BWSvgMX01PlWXwQ8AyA7q2omju1ue4f4t7XCrruzv4gBxIJfVScaxPXd7mA67UOR83fP
         lf7sdldtk0Qzfe1b0iJFagV8dRjqnTvgNblUFbMzZ95K6i3Nnw+MS8kJ2d/0LMUf7SN/
         xhkK7yvH4v7iGyDYNkUYbKENF+4EN/Tu+AGhaJo+Lk1oTCoGNdvtD6qNjjCQYMWViL9e
         GgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771404277; x=1772009077;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4AGbJPnQwFvIJpxdlL3I9UAJZ5tojgKAthjJExwJ3o0=;
        b=JqX3W9V1X/R6qB4xaWQkQ6akvf9IYwuc2uTbb0okKmXqv8327HBxaEpWowVLNQKIgU
         Pw1A26zEYqs9kJYVq1OKLzJ8RKh9TAXLyDyf4RKYZ56bIncpFimKkT+HbxsD55exo0Fj
         /xXKB1tZw0vicmYaTDuE79zcLTDgyRCQ7bo0Q8+I2ZWWZ4dzw1ZNSFAkEfsJimx+WpMU
         LBV8mAFTrGebpt7twFeR0ilQHPE7UFP872jq5aDql/R3v+6KDyy33+b8BblIfTFzyaw0
         qmj60I98XSS4fTk/kQi87bbw+O+i8lAjMpxjuKI/0eA1b4H758fo9ePZRUNDDOdCG4Jj
         NXPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWT6TjCJfKdiB85h/gcvCIXKeefTUYPR6SkR4rXjPJvbtSfhADStFGZTSgOeC80o58Evb5nFKYQYClXvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkyVpxzYqRbI0gWFOsD6sGa4A0VzS3v8PrQOpGMMu9A773lAvq
	T4gtA4CZ8cqQLTxCMsVxztJHHsYWK60ybMPncRM/Ixb3oCLvB3S1/grX1Wic+PuXqg3URcgmaux
	5jdMS6wl71K3tN0Fc+wPmwvFt05JISJ941dOkGXm+SOvxoXXaNZ6I2v3MGHyRzTkYEobw1Sr9Yg
	==
X-Gm-Gg: AZuq6aJBPJJQ0usHG5G3k8EosBUIJ/LikZ/kY38B+4xm9TIc4+OXKid+h/rjXP8yI+K
	tzAoILeDQ3iF8PHH5XehLYvATLd1wqbPcnLa8QwMJG54/iuAzyI93jeumlIcK5niRzUrdDLiJQt
	bFOqd5HNiWL9pTUvipJNE0w1FrZ5ZKnJhNitfHdxSmIerv8QCnSVrqQwJHsOQC6CdBqSvGszLik
	30MWGnzQpxRuinEbMgs7nHoapCtQsMMwnkJIZ07IcOzMbjmyZlGxbh3aNwXJ3jMFH5y7p3ZDsUX
	AS8jxo7KWWSQ65GvbcDW+tRA1r/a9k5t/3G8O2UtE9ALLVGO6AIJsUFXbg2mmdpbjd9jweEaQGs
	Hy7sTp19AkLx1BUDDx90zk938ykcuLS8HgvVgAjBh0kQLzovK9DNwiwON+SSizJfAoCsrn1JaUj
	OcLKb6KAICkgiqf3wyX/4fgf1iDQFHAr+29M0=
X-Received: by 2002:a05:620a:3f85:b0:8cb:5477:5269 with SMTP id af79cd13be357-8cb547758f2mr1364563985a.3.1771404277155;
        Wed, 18 Feb 2026 00:44:37 -0800 (PST)
X-Received: by 2002:a05:620a:3f85:b0:8cb:5477:5269 with SMTP id af79cd13be357-8cb547758f2mr1364561685a.3.1771404276625;
        Wed, 18 Feb 2026 00:44:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5b051asm4338028e87.72.2026.02.18.00.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 00:44:35 -0800 (PST)
Date: Wed, 18 Feb 2026 10:44:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom,rpmcc: add msm8960
 compatible
Message-ID: <7gdpb64yu4ydcgfejfavq4g6vc3rz7cn3h7shle7gx6upscpki@podywah6acxh>
References: <20260218-msm8960-sps-rpm-bindings-v1-0-bbc11c0d4f24@smankusors.com>
 <20260218-msm8960-sps-rpm-bindings-v1-1-bbc11c0d4f24@smankusors.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218-msm8960-sps-rpm-bindings-v1-1-bbc11c0d4f24@smankusors.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDA3NiBTYWx0ZWRfX3n1B0Krb3rhF
 osqVrecJbDqAYklSH6EtNhYu0HT2J92+TmlQHYnItv+fhLuejY/ygJk/VhSZD7+bnE6cy5zJ7rZ
 ffxQ+TBOIw1DErXC1vj36nh96NDCu1nJ1ggoFBRbvTY58oKnAWvaOmaoztamDjo/v8Lg+/Y+5bR
 49coL4DoUvf8lxq5780e0g9Z2NA6+hA/DQf7BQGLamAtTA+/ashPFdQPxJox1t1vKAyZejTozG/
 5IcTdeDiq1uX4aRa7jvuN3xoHmazSM2iycqPgcy7a8AJGObFVVugl/P04t6Q7mvvqwgdJsgT13c
 kV7f7tfHh8zLAyi/5TRYVfyyXgUczxiqIQcuOv+z0f4QF5+SNZDloBW686/j+SC2ddA8/gFpdGm
 NYNIN/e0JWy8eqCutH3/VVEyZ2kY1mId7BO+QbJ/fI5jP3ZBg5Fa2UKWO2HkYTJzqohykYUmBNo
 Vqzisv7w4RtY6OYf8cA==
X-Proofpoint-ORIG-GUID: 7UUIs8UFvCpZdJBbQT76n-66VUltTYTN
X-Proofpoint-GUID: 7UUIs8UFvCpZdJBbQT76n-66VUltTYTN
X-Authority-Analysis: v=2.4 cv=YdiwJgRf c=1 sm=1 tr=0 ts=69957bf6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=wxLWbCv9AAAA:8
 a=HlxF9o-pF0jV7hyblJIA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_04,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602180076

On Wed, Feb 18, 2026 at 06:59:05AM +0000, Antony Kurniawan Soemardi wrote:
> Document the qcom,rpmcc-msm8960 compatible.
> 
> The MSM8960 platform shares the same RPM clock definitions as
> APQ8064, so extend the existing conditional schema to treat
> qcom,rpmcc-msm8960 the same as qcom,rpmcc-apq8064.

The way you implemented it, it requires driver changes which were not
included in this PR.

> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
> index ab97d4b7dba8bc8d38903b399d2bd4bda087db8a..f84d08199e47f45ecb176d350eeb7df8c3ff506b 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml
> @@ -36,6 +36,7 @@ properties:
>            - qcom,rpmcc-msm8937
>            - qcom,rpmcc-msm8940
>            - qcom,rpmcc-msm8953
> +          - qcom,rpmcc-msm8960
>            - qcom,rpmcc-msm8974
>            - qcom,rpmcc-msm8976
>            - qcom,rpmcc-msm8992
> @@ -90,7 +91,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: qcom,rpmcc-apq8064
> +            enum:
> +              - qcom,rpmcc-apq8064
> +              - qcom,rpmcc-msm8960
>      then:
>        properties:
>          clocks:
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
