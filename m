Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CADD21A453
	for <phone-devel@vger.kernel.org>; Sun, 29 Jun 2025 23:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751239834; cv=none; b=IPoRw69lPXCAxDntEqp/4FpU4EbmZFt6WFfbOV/+ySRdJMv1Y3s4alDitMoOB7UXzF8J7MMt3M2tjP0zf/ORAv9P19RTZVDG+TPMLC6UCyJwjD24oDCw2+2rVLBBS/NkZq3mcmyNxoANfyjfJTEuNE7xDrsSjGNeH/AHZyoWRNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751239834; c=relaxed/simple;
	bh=3AFvXCR+bLX+Z8GgWNplffmabN7kiO9ZobmutwiK+bk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BFX0UdQ+lM2XdltWzvMVOrpYubWgidSmrS+7VWI2cmLED7ZM0om7EmQIBTaeV1faKST0pp40aPfeiYn66WtbHzz2cuoX+CprwdzcoVBWlq7Uws1Lkvteu4ZxXx0L8kefY7XJ+3NT1u64euFfgHfSn9Ogl7kUxFXkxnTrVE2uqlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eCgiDsJT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eCgiDsJT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TAvTI1018611
	for <phone-devel@vger.kernel.org>; Sun, 29 Jun 2025 23:30:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=S2DTLYpxIRhT/nA6PB8/tp+3
	viSuwHeW5OhO23oo2lE=; b=eCgiDsJTEoNxBfqEo08mj8Z3xu+cN5h7tBDr2b7N
	GAfLLdTEIrwoWEOKSVxRyKmaPPg6Bg5wYMdLdMBnLqwlCNdUylL4WXTclVvRASzT
	HBT2ej0w30v3OjB7K5ETY4cdib2qw25vC4doGeC27MTV6rVRS5EZX7VDyM1XySHY
	Y1TDFEtG3Eob/cTpW9A5XE77tVf2RlxZQuW88rT7GWS+ewc6JUltl2quo4vDayea
	HM5bd/VegdC64DyKAtuAVZ2h9HnluhKHULQ2e1GxfcgxAlAHIKS9xvwcQ4koxuE1
	q7bFkZwk0u/0V0peYimRBLpjOH9nC/82j640OWh6Zhxc/Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63k30vn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sun, 29 Jun 2025 23:30:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c760637fe5so645216885a.0
        for <phone-devel@vger.kernel.org>; Sun, 29 Jun 2025 16:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751239831; x=1751844631;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S2DTLYpxIRhT/nA6PB8/tp+3viSuwHeW5OhO23oo2lE=;
        b=bU56AZ876Q2MlxmkBl4Dv6UJhUyuu4ZuTbVxagQlTuMpow8KR+HKQTbx9WZD74tkrv
         brFbqZPrwxICqvj+jU2c8i/8cDdrcwwQJwNQIcft9ZPGG+Vu3L/rTpTZ0v43gyrheqk6
         VaBZ+/+3c08gjXWnu1D34TUUfHBWTUUI/MaoLGSsOpIFyijyCpxK4dI8kDLUJ4If/mh+
         34MF0/UZ7HIy1sUMNzFdg6tNcAWtBposYMPaYkhmOyzSYbbTLDDxCvJL+0NSjn8RwyCe
         CCoVoSHvlGt4vaOQuWHsRlDsgIPwqBY345AQX5rFvn4pxB0ghhPdJz2c1dodZoCg9WGb
         igOg==
X-Forwarded-Encrypted: i=1; AJvYcCW+x4Eo4j5eiO3a6dP1+7yrhMSGRbT9o6U7sjn4U6LXv5Pe7DxeCj6ZHF23DB34NLVQWO7sz1ldl6p0zQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwggJnzeM7sq9r5baVxnSDqSaQg/w5xOB/ciQYWTe0cK2t7Y/1l
	xPJZBbLhePipX74e1iUD/levDvdwli3cWOEJaMBtZBTdAU7QoYF+7SzqNAzT247dSWM5IYcsNLF
	JN7JGb88/9cp+4tZqzHxkxaNrGVo87SIFTUk8I9Idy3yKHJw8d60LVl0rHGXIqoNMFA==
X-Gm-Gg: ASbGncv2GhdA3VfF6jKotvmzqTuzJdJbSupxedZfM4StJt6965quvJmGZfwYDHZjDBe
	ZqcfzTPhTxZB8dhIQCpaU//wP0upc6kTbDcHcBQozORInWDp8HTcAZaTtFD2RaOtwi9iLhjQUc8
	aii/EnMlIMMlUTQ8Ose3wjDf8npKxUlEQZ6/rYqin8L5HE8urW+uUwt2UqfqvCW58cd+dD+8PAg
	7giPZs8WEsMeMzO3kGU+cCabp6smCdLKQI+ugxKCZgHUlFVTrBxliMK8d4wvDZ3RaNKbW/DNKMA
	+gzLlGwM8JQD2XdNTGHILMwAMtKhfdQ7wHVwygs86/YfKGfaNNhWcTdYZAsu+Ez3et0YMeqT1CI
	ig9Z+yN936TPtNEdg0AycxUff6L+78iLAs24=
X-Received: by 2002:a05:620a:1d04:b0:7d3:c501:63da with SMTP id af79cd13be357-7d443985d4dmr1744007185a.48.1751239830848;
        Sun, 29 Jun 2025 16:30:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsLLpB2ln2NTNuxE8oAZN1AOX2vanByzGZqG9Al2zbL1LihsHxYQPgaiL9CfBNyLjW9EH3XA==
X-Received: by 2002:a05:620a:1d04:b0:7d3:c501:63da with SMTP id af79cd13be357-7d443985d4dmr1744003285a.48.1751239830424;
        Sun, 29 Jun 2025 16:30:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2407b4sm1245026e87.23.2025.06.29.16.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 16:30:29 -0700 (PDT)
Date: Mon, 30 Jun 2025 02:30:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 2/2] pmdomain: qcom: rpmhpd: Add SM7635 power domains
Message-ID: <strdf7m7tjnktyzwcm3iq4bkhabzibxopeal77cnetga2yp5wy@amwkv63uoogv>
References: <20250625-sm7635-rpmhpd-v1-0-92d3cb32dd7e@fairphone.com>
 <20250625-sm7635-rpmhpd-v1-2-92d3cb32dd7e@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-sm7635-rpmhpd-v1-2-92d3cb32dd7e@fairphone.com>
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=6861cc98 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=3owI59sVmJdHpXqbcb4A:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE5OSBTYWx0ZWRfX4UnTeEuz79La
 16CNEfV0KSmvLD67mKb2ON4HG7z8nQ1oSxJvzWV1qVnJGAj1MIEuUxbEg81IxjeTAJWb6g2spXc
 AGytxq0uv/TGFBv0zsyBxii8rX6FkC+QE/4wP6cjVDcwCRWWyGyDXvi3MkcbDAgPJ7WWwaG7fFl
 JBwmVZwCgratKN842I8wuua/4q2huWQWLgspQ3xuu0cq7WIem23+8cWP9tzEjM6VJ0mAccHg0Vn
 GDDbnlaOEHMUzce1OUCarnbTEM5FNYCVm8aSYS9AOWvEME0WXAXFOdBe6SPyVZ2oOzNMDQNJPZg
 7IzWEIeCrnMx6ilyAlc0lZd7uWwC03vB+kunBo6T4SweN/AaEwZyrQRD8u3+pFCCba1o6Z1Vr22
 u31rQN+YqswFJWuXiEJsqNyqYmsOHE4YeU7jjnbzPuKfxFP1mJ6KvABI5VB1MjgjFuidl0Sk
X-Proofpoint-ORIG-GUID: dYLJj5PRtx0TWx0BnEsy7mxHnfHuOpFY
X-Proofpoint-GUID: dYLJj5PRtx0TWx0BnEsy7mxHnfHuOpFY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=982 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290199

On Wed, Jun 25, 2025 at 11:13:24AM +0200, Luca Weiss wrote:
> Add the power domains exposed by RPMH in the Qualcomm SM7635 platform.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/pmdomain/qcom/rpmhpd.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
If there are no renamings involved:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
