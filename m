Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639CA1C84DF
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 21:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750885417; cv=none; b=QnlAkn/YHztTRAGuhQdTatX3TBicb+IWCk0yoKCoGPzLdnM+JHvGdk0GrOT6MDYd5QsP5AjAbY5n3L/UjVE3UsPEzUhXk/+vlI88eAG83pYyjuatx1q8u8mYY8r7cXsSFUKeO0iWISePolE+JZvsXyYlPzkm//lMvyKg0VPXUbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750885417; c=relaxed/simple;
	bh=BA1SJ7BB+xjW15IIb8AKZyMEAqBjcfpDeU4wKnF9SNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KXyvk6SQZ0GElzvVn/Z+Cn2RgI+aioKYLKj8Mgp5hE/70zk/xyop5VGFCrxsu2nEbTPI/5nfr9fCOM8M+JhNcC2hLm9hdaAplyEtowBVf6VyVsYtgNc3LxXMOpe0jWEGgGYMVqhMI57TvsZ/vPVQf/SLcy6oeifqsC+TVUQGjwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jE5QY8OC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jE5QY8OC"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PAIEvr022517
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 21:03:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6G8NazoQCjyeRDRCOe2NN6H/
	BOfkB3FLygIjOlcUYwc=; b=jE5QY8OC95ET4xnGwB0hcpWGffIshWW7qDsJ7IbU
	ODJMc6E7WrvkXfdg6/UTmUu/+QwSdIij1tBuUMI5fuM9jU5adiawiAb5P8k/Q1VL
	oYggcBezPDsNBp/gx05kv/seoUZsbs0cbD8fdWYYbUe1ztlcvlI5FzXIQM8FE+Uv
	kFheIsCpk4cT70gNQXsj4NzCuZ4/H0AEnPEUiqy+iatYPWx6X1BvoCGWTUzMxKue
	9XcuZ8m1GnD7ovHobwgw649P3wOqRBYHoT4AjMf6JEIMi1VurFLHTznQdJlFqO2j
	3vkLesROGNrUcSCNVHFZaSmywIlOcis53kzvuZVBHWOOmA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rq1cty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 21:03:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5bb68b386so76368285a.3
        for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 14:03:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750885409; x=1751490209;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6G8NazoQCjyeRDRCOe2NN6H/BOfkB3FLygIjOlcUYwc=;
        b=mxCk77TM9vCGVl67oGpVOWUpwkYYeoQZQ6EV+j2jv0jDnXUklI9z//sdy2QJ14cKG3
         firY9Q2qDE8k4xT4Jd3z1NL3NwKKIa8apSEPuvL1HWQ0QdqWdpX8is3ICqWCL/dekF7V
         d6c8iWcZq+3RgqXM3BjZXfDcH8RXc27+2XRwrmJnuWaqe1OI4fzMwzTnt36aA0mU+t3k
         /vxldQi0Iv7YiUNX8mdY5EjnOWQcVTbyeksXW4itCtv8e4Osi2r+WDcEYDS26HW4Eq9f
         PcvifUGZsg2rRqPFx5YTmErqtmNktrg11o4JzXTKhpugBW/bFSnKynlPFuJ2iL9rWVwP
         1BCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKf23cIDsR0Zf1ulgOVNjz1SMG9b6Jj2FwCNkvc04S5MXIrY+GVlwrMugzAaAfXbL7hjBNJ+JmJ6RVFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YySYUSH8hV8vNwuGNgngg2pyKPIe/ofrqxsfCyWBEuFvE3yplHB
	8s/bhmMjKls+INcKERk3hbsDxdnTXXjGwm6CR1VtySrtc01FMz/PiWMKNDGi9ONySPvjQX7e07F
	9s+PnhsvVDu0sliiRyqOHQejX0H/bddlZbWD9ItLVIphQjzSgDFDve36dXM9vG8319A==
X-Gm-Gg: ASbGnctcnL4226VttQNazgJaM3gK6KJjkQxtxh0D7RNEJM0GIJcGs3tR3aZNBFvHxIV
	MbZZUqa3SoGEh5gBu0pcn9jAN9gWkmqwJrbw0EvMdMBiY/oWVloeR6HeZkYbkYiXYHxUTacTbf+
	d18DzGO+jp9/2Doz0ZCeHEKOZZ0qD9EI7YkqOd4wX/o0AKDChOK6oO4jnQVc5IQSF0qaVSCLB6E
	7LxhcuJqMsZ24NHhBUgN8+LVciZkgBcLPsImrEQYhFn9VjlfnO4LrVBb/zmhmSdOv1AJzL6HMD/
	4pP+9nJdxoMNhKtYQPwtyHZr02uMaFYSmSSSFxknfZnolpaAWX8AVvKDRgtN+TXkhFlk6qqlV9F
	2DqSQWRKnKenwO3Y/qeA6T6j3xu7s0pwqOYA=
X-Received: by 2002:a05:620a:6293:b0:7d3:8df8:cc04 with SMTP id af79cd13be357-7d429754e9cmr611509885a.35.1750885409407;
        Wed, 25 Jun 2025 14:03:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7oKjmuvEEF1WQFmTjT2Ttz48tRtbggO2WDZJ3rR8g4bzcxgd7OZWfwRoKuiaa2MrZBIv4BA==
X-Received: by 2002:a05:620a:6293:b0:7d3:8df8:cc04 with SMTP id af79cd13be357-7d429754e9cmr611504685a.35.1750885408782;
        Wed, 25 Jun 2025 14:03:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b97f594e0sm20999961fa.23.2025.06.25.14.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 14:03:27 -0700 (PDT)
Date: Thu, 26 Jun 2025 00:03:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Add support for PMXR2230 PMIC
Message-ID: <6zut6hiwig4qanrmloqvibx4tmpb6iv23s3hp7bb4ja6jzzia3@wnre6i3mukbp>
References: <20250625-sm7635-pmxr2230-v1-0-25aa94305f31@fairphone.com>
 <zmqkdpmji2uodm3mxcteteyhfkef47kihola6vtxb4mhuynqwz@hvgfd2637mhz>
 <DAVPDN4U6FSJ.1MHMT5G04KSKA@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAVPDN4U6FSJ.1MHMT5G04KSKA@fairphone.com>
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685c6422 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=TnUiieDH8m5hmC2EXGUA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE2MSBTYWx0ZWRfX3asJrhfxCZ9V
 PfBz0CjOIThIfvociPzhC2hGkkHQa6f4DNiAy4dLwmZSTl03ILxmmXWmMUGTWpWZzxZvAk29ox6
 KRl9a2DxVOCTxukb6ku2jCVuD4ec+DxoruobBYdHmQ3QaSCxMm8dG5HmHnesun+Z/Q63A/ZJPFa
 lX7mKah9DxELc93U7JEnmigGECtX0LUikZSWMkn8WC1Z4sfCpykudJ2MUEt5Aha/nA8KTeE3PiS
 Yz+iK5T976MtQGS/yUe1ZqA75SRR2PdjlDlzXr31i6ndtbDqp1HLGORIO+ygl6bYT7cJ1zjgpLc
 suDt0Hxf7vjSNM+I4drY+1V1fd7O09v74opc08LuPQVxzlhisI5x8g/pof0QJ84Owdvd2yPB14u
 0iwQMYBx9hwZBSz0xI36LaMXE0Z4LHQtkfWkHUbGou7Ul5p854o4OXCQgX355B3MGlz0yj9p
X-Proofpoint-ORIG-GUID: rG7TEYbU1O-Nnbl7xZrbJCY0UCjGAsXn
X-Proofpoint-GUID: rG7TEYbU1O-Nnbl7xZrbJCY0UCjGAsXn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_07,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250161

On Wed, Jun 25, 2025 at 05:01:29PM +0200, Luca Weiss wrote:
> On Wed Jun 25, 2025 at 4:25 PM CEST, Dmitry Baryshkov wrote:
> > On Wed, Jun 25, 2025 at 11:18:36AM +0200, Luca Weiss wrote:
> >> The PMXR2230 PMIC is used in conjuction with SM7635. Add binding docs
> >> and the devicetree description for it.
> >
> >
> > Please use PM7550 instead.
> 
> I'm happy to not follow downstream naming conventions if being told, but
> do you have any details whether PMXR2230 == PM7550, or PM7550 is just
> another SW-compatible PMIC as PMXR2230.

It is PM7550.

> 
> Also we already have qcom,pmxr2230-gpio upstream, so that would need to
> get updated for the PM7550 name.

No, leave it be. We should not change existing compats for no reason.

> 
> Regards
> Luca
> 
> >
> >> 
> >> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> >> ---
> >> Luca Weiss (3):
> >>       dt-bindings: leds: qcom,spmi-flash-led: Add PMXR2230
> >>       dt-bindings: mfd: qcom-spmi-pmic: Document PMXR2230 PMIC
> >>       arm64: dts: qcom: Add PMXR2230 PMIC
> >> 
> >>  .../bindings/leds/qcom,spmi-flash-led.yaml         |  1 +
> >>  .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |  1 +
> >>  arch/arm64/boot/dts/qcom/pmxr2230.dtsi             | 63 ++++++++++++++++++++++
> >>  3 files changed, 65 insertions(+)
> >> ---
> >> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> >> change-id: 20250620-sm7635-pmxr2230-ee55a86a8c2b
> >> 
> >> Best regards,
> >> -- 
> >> Luca Weiss <luca.weiss@fairphone.com>
> >> 
> 

-- 
With best wishes
Dmitry
