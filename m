Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9208B1A683F
	for <phone-devel@vger.kernel.org>; Sat, 18 Apr 2026 16:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776530753; cv=none; b=K9uIszSX1G7wXI27YKb0mq6AHnGb5zyT8SOqTEaPuSzOoYrxUwB8URIRedF4/3Gts6hE9BBi/5cj8sqh3sUo6h5btPTDtKSVOqBjTxnRz1lKWnZOU+3AFsPi8HRXX7m7Jhj98kUfWejeTnUVMj3USVf3dKvFx1cwFKMddXtychc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776530753; c=relaxed/simple;
	bh=T3ogW2iorPHrKlN4Csz7hRqiCqQ2aKbewaDJgkrFG3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z0MjHq47rRnvLbob3rvGodifxnKJZW+xj4c2Trzjm7pPG2JgR6QhlxNlV/Gi87H/Dt7HXZTvWvcleuYZK+aqvpY+0rbvgPSiMnMXl2ZA87FUpqPzUoupRG3E2YE2E9CwjE7nM2UKmmAmRW+vOI3VQ+v5I+ilBVyhuJckTFqHs/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KXWVbuWI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h23e2wKH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KXWVbuWI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h23e2wKH"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63I4Ubf41430921
	for <phone-devel@vger.kernel.org>; Sat, 18 Apr 2026 16:45:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qYOBgSOW36gFbpuV/19POEEa
	CpRmiqvhCP/9Vh9X9Sc=; b=KXWVbuWILH5GyIN22UyvY4rqBci/Rv0GyFgzjvoD
	lrX9K1EGCrRofdxuoW3gDNBOAtCnmr5qjOwI+kf8phE61y1oZNSNutKGO5duHWqZ
	B7E+l/E16Pus8Q9uSLu2JGmOgx6Ve0vA96AUl9I0Pdt3z4V9DSLzPZTBmYn4sG0t
	6ObYZJt3o2uuXMAY5gllY1U2SUXcmUY9CRp5eJcLsxLw/2rJePkHpkwm/KShoL+5
	aS18V+XTny8/5tdhnsImwJGqudZjfpjUR58KUR8+DMTj6bmHAdXNRJ+KYstsJIDo
	+Mq1d5wlUQtSLanM2Rah0Nb8TymcpJO/f25P0j5SN4x2TQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm21uh3sv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 18 Apr 2026 16:45:51 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8b02af4345fso46034296d6.1
        for <phone-devel@vger.kernel.org>; Sat, 18 Apr 2026 09:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776530751; x=1777135551; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qYOBgSOW36gFbpuV/19POEEaCpRmiqvhCP/9Vh9X9Sc=;
        b=h23e2wKHS3Dm+r87e4yu78ir9nGAbbtFtZLrFXHmKGKa0PKpCUtgP0jRYBsCxWpnb9
         6z4bz05D9XZAWfrxd72cXhaGhUmNO5Go13a0q7qQ+J4qlkqax42tzt08IibdsmxfKxZz
         k1yIIjUWzDrCKwZPhvNjvAdYSYNX4IvHAq03Xyd/6VH4E2cJl53PJYWyP1oJpvqw5jLR
         k/BNU5BW+D7x0SgMNZv++9DIXATGTo49KVfa9rgSQj3n7BrmMgD7YPuvSlY9mpC61zML
         DTEKTWT5oI64Dr9HlqJ3XL8lWnNj4q7WnZSsAMdJEhp3aGSKE+CxjLpQHuNTPozHiJEo
         YMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776530751; x=1777135551;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qYOBgSOW36gFbpuV/19POEEaCpRmiqvhCP/9Vh9X9Sc=;
        b=FGFLjXIWaJk1xJ4WAXM3k3QLhSTBCMpldJJAtMk9xyAMQbgbGXbOAoy9YvtdISXIVl
         MYfAvtFY6rUYsMV0pNuh8fGBTXHU1oZVloGMqIVaqYeBKvJUgw4xQyBtRh28aD+ASZdl
         3tmoVmEmeGog1o9LvhdGhgb6b3p+d2TjEFrWeTPSbmH8BJeftdGP1c16hU+tVymXhV2I
         eY90Z5uzEcBRS4vhhYK+BifD6WensKMPaJKlKiY1Lr/UqckNDqrOqzQ9xMyiXqXQ6gtP
         5JSUoctQUWCxQqWYyoEBBzxqNov55v+/gHF2/bBq03u9vmEGukcbB9YfIPbWwG1gVsKL
         ejmA==
X-Forwarded-Encrypted: i=1; AFNElJ9/gYfrPB+0K8P8H/D8KuC59Kkiao7VoKzKYg1zXh33AngxDjO0wkvqbeI15LCw3vTZwt8T30Zf5xtU8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIjMLiZZyFNVRvg6pP3KZZITIBX/FiP2wPl2J56EfnaeE+iGnb
	ntnpGYoAJx1mi/rFc6czrLALAzZz4bXBcM+PxyLIunb7+t6P0erVn8GOUCVUMMlUh1gfGF83uex
	BFKPxIZySfOzUPbKx/1NM17DtCWVkjycFwzhRjPUqSb8jhA3DkgYFlZF36tKpFFJfDw==
X-Gm-Gg: AeBDiesFGJFjqW+QRL+QSdCpwV1s2yzeLDQKeJSfV7xpMEMlYjjd5iqi8WB5t24U3SV
	2ScmBPLCsPZZQnKQSUsCDVxGnrIjMHv/Ep9QRcFqTQo/qCydG3+td1cqfGIcPtZNwr3S1Myvwkk
	L4U1edEyoTDbkS/BQucZfICcanG/bvQYMUecZan2S4cw9ioXesmvUPjJDykiYtHgcJKdZmLoICj
	YPqBgAa2GpT1wY2dVxENqktpUTP2QXIqIlSSimgutYgJx3MgAAD24x4E0v6s43s21D3fhkihDQ4
	C0EBkS+k1P8GW2mz1U+bFBGaKsWHIeTvcclRK8k6S64ocBt9fJkazbWGdBvHKnJXKrfqAPGaUtN
	4z4rXVe3vFM43f+YP6IaDD14ByvVr5OyvEPqygYGRBw7SPSa5t9c6tNPF9cOMElraMPKTEmSvum
	p0Aw94X+al1xXOSzXUkeBXKFlEgo/SLy5Rs7Nm7FMyGgeHUA==
X-Received: by 2002:a05:6214:e4e:b0:8ac:b204:3238 with SMTP id 6a1803df08f44-8b0280cd9bfmr120627776d6.30.1776530750889;
        Sat, 18 Apr 2026 09:45:50 -0700 (PDT)
X-Received: by 2002:a05:6214:e4e:b0:8ac:b204:3238 with SMTP id 6a1803df08f44-8b0280cd9bfmr120627426d6.30.1776530750474;
        Sat, 18 Apr 2026 09:45:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e1209sm1468024e87.43.2026.04.18.09.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 09:45:49 -0700 (PDT)
Date: Sat, 18 Apr 2026 19:45:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux@smankusors.com, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
Subject: Re: [PATCH 06/10] ARM: dts: qcom: msm8960: add SCM
Message-ID: <ux57o2rnkthojbucnam3ih6hmefjlimhybwghywcervqcnfg3v@in7xfev4vjqe>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-6-007fda9d6134@smankusors.com>
 <d53f1499-0afc-43e5-bee9-ae76df3c6910@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d53f1499-0afc-43e5-bee9-ae76df3c6910@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDE2NyBTYWx0ZWRfX9MxUxjChGflc
 92h2ugB6+V8t+lQcg37mP++xYBuzNNpSWpy1Hwjn/rrqQLXNIzQBRvOgauMNv+hx2z66skFCtWH
 LOyHonyE4GWkGG0YxDCnsWjcvjA17BVjAcevZrTw8yPRQS4WlTYpMl7q4x1FEAr9oSJHeMbsujQ
 IxCh2vcDYZIXjA8UDJGhS6fXWQ19ItS/kk4EbH3800qoo6mckSbi+H4cGKPqi6iBxsDaJSkewGW
 zFBrlfvE0bYePi2QXfSfzhOCRMGhBShcjPSB9BxLnxqd5oPQCRaTOumG1IIgvrE2RyeobYi3Vp8
 ACn9FcBFhPpFJ5iK4dRayqWfVsATgR8yCJ3FBUdwcqJUUYY7I5wQ7/k6t1imXVGy2chocsAl4ju
 0tdPrByGwH4rojwTfgZTmbJ0E8LHci+5NquJ4+Ei+N7RWqapPVjiaqDFAJvZMioJspI9DjoIVPs
 j5e8Rn1aQEWfYq6nHCA==
X-Proofpoint-GUID: bVcUoeUQKbp77kv59Zd2qSVqREckWjrd
X-Proofpoint-ORIG-GUID: bVcUoeUQKbp77kv59Zd2qSVqREckWjrd
X-Authority-Analysis: v=2.4 cv=WK1PmHsR c=1 sm=1 tr=0 ts=69e3b53f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=wxLWbCv9AAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=JV34PUTpeUbgs-AlXZcA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_05,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604180167

On Tue, Apr 14, 2026 at 11:46:18AM +0200, Konrad Dybcio wrote:
> On 4/13/26 8:55 PM, Antony Kurniawan Soemardi via B4 Relay wrote:
> > From: Antony Kurniawan Soemardi <linux@smankusors.com>
> > 
> > Add the Secure Channel Manager firmware device node to the MSM8960
> > device tree. The SCM is required for secure communication between the
> > application processor and other subsystems.
> > 
> > Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> > Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> > ---
> >  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> > index 1d5e97b6aa4b..bc3fd55e524a 100644
> > --- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> > +++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> > @@ -77,6 +77,15 @@ l2: l2-cache {
> >  		};
> >  	};
> >  
> > +	firmware {
> > +		scm {
> > +			compatible = "qcom,scm-msm8960", "qcom,scm";
> > +
> > +			clocks = <&rpmcc RPM_DAYTONA_FABRIC_CLK>;
> 
> I'm wondering if this should be an interconnect resource, but from a
> quick grepping, I think this is always supposed to be @ 64 MHz so
> perhaps not really

I'd say, this matches APQ8064. Let's keep the platform enablement
separate from refactorings, especially for those musem-grade platforms.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> 
> (please tell me if you know more)
> 
> Konrad

-- 
With best wishes
Dmitry
