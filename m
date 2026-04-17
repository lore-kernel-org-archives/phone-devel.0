Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D02C347503
	for <phone-devel@vger.kernel.org>; Fri, 17 Apr 2026 23:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776469247; cv=none; b=dw2gRWtqnXs+K12Ajna805rc0u/mpwSjfjUmDfNLBMyNBYsSqKTHvL2uCC99Tupz3cJm7plIE9HiqkL0FncTlIcqhCrpUcI72D6ps6leyijD9H7+9IPun5gXZ2ShSNN6EPs2qKFLGgc88J6gpz7Qnqrhs+3Zi9gtazD2QlblNPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776469247; c=relaxed/simple;
	bh=QLwLIyybGbuhb41Lgyr1BzNXP2BvhlqRdi9W1FpKYqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s6gEbBDmFYGjbKPARcJieaubrPYA7XTEu0/9rwFRb+NZUg1FBc3y4H2hGog4y2wZsdiF1g39alPrOBnWQwf5a4U192ZWcKz7pdvhJQcWOmHVQhcvcmJcL2fP6zqLdBrg+N86Gf1liPI/ckY6NsN40vQf6xAYWt69xMfuTIFVs9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IR8r4Cnh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EG2x6Wxm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IR8r4Cnh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EG2x6Wxm"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HG4YnV454946
	for <phone-devel@vger.kernel.org>; Fri, 17 Apr 2026 23:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vqsleupIiijc5MZBwUfkwuWc
	PF7CundACXwuw1EL1BU=; b=IR8r4Cnhs/pt4yc9JuNn9TtnARDPergZKPLO8E26
	zk5f6A8g0IkEw65cHK8KVBWDYsdXjtwqW5NUqu2xpeDXoCC31IriX6D3rSCxziXq
	/6zWA1Jiqm53KpxBSp6HXSOt75Ni5C5k5GUjB81WWydrtq153+Be7IOwibzm+edV
	K8gZgXjPnaCxN06hMv4CF4eBf43Pgwy3iAdjcZsvQ7r6zv9IiJEXK6UmUoTtbToU
	Z4sqT+09V9r7VS3CLUCX36k5M1WZvBEIdhxG+RlfiEJFb0JoiNEHrWEUqfz04iHl
	37x/FvYuP3uw4UERu+JATakFw6cxDxXn3mh1uupCAWM6AQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkg88u3xn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 17 Apr 2026 23:40:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50df4c130dbso35122561cf.1
        for <phone-devel@vger.kernel.org>; Fri, 17 Apr 2026 16:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776469245; x=1777074045; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vqsleupIiijc5MZBwUfkwuWcPF7CundACXwuw1EL1BU=;
        b=EG2x6WxmY8+h1xq3/34/Igd6BhET1LB9A2JrlBei59S1377NOHky4oqUxX9olyYhB+
         eiFFSxnaPWoiTK+k6F3jwiT/6H1RHoZsxzTtxu0V1ImhtKRRJTHhPGjdpvdoLgfIS0x8
         EjgEKmss2ZqlSC749kdTV4/MuTv/z4nO//kkCt+HqzoYSKXNQbzdRPm5kJ3+I+WGPexp
         km+JrxW7Ym2cQV5f5wiHeitx362pyZFc+z4Ve911jMhnbI3fZTZM+J9MmLeLrFbfztLM
         lxPtfTZ0RosgUDYl0LEme8vdNprfwcRAIpE857WIMdhuNihA3+ch1DxE1n2P+4KrSMKD
         8A3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776469245; x=1777074045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vqsleupIiijc5MZBwUfkwuWcPF7CundACXwuw1EL1BU=;
        b=VDcw0VIR7tS2Clso63H9O+jaF0XFD/1tqkUTFyLkc7aLXm2KVEChptQVjAUqoIy7yH
         xrhiWAH/2nWj7Y7QqPwcTmAcrLqCbehKy+P434yDZKJGq4xSqn7Ewu1XeaNJ9zBq5dLx
         UfsBR2EPCU7YNmR6dgiACGGwI3KPw8kOlTPxu7G4BVxGqhcFKOO1JaPsxI68uaOAQtSo
         Ow1DlJnqXe23XoU2M+DP88fL+BNTKL4MCtuzFjYdQkmIxt6buv6GcRRmzvSmrg79RiSK
         9QPkrOd3PDrERIZttWJLSxL/jztxnbQ8dfPuod7OwJ1r18UTSuSqFupZT9xyJ93b9Fr4
         m3UQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Ka5jxpX5VpL8jTIV4gKSFqIGT43aj1kPaKx2XeqLEj3PJBQnpltOI529DolcyDnkHABbnrANuJZA8+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLPdkgl0gbVc5jTVx9tBc+6zkYaH9eG0BJcs0x+X+gpugnW3I0
	bP7hkola6a8qM7tkKKxz3xelRsCFuybyTZuGKJKY9Ep8GwfPv7B2u4j3WXA6Hz33F1XFVikaV43
	jg5WvUeBB8DqN8NirPG3Us3AduGDYqKOVHlFCqtpYpGkfWhtBdIh+WliWMbmqY1qaYw==
X-Gm-Gg: AeBDietTXtzETMDwRhSazLgKdu/eGfCoQzYN3b1isiorEHtzP4j3rS5o8WIIHvzC9vk
	lNI5GIuSLAce6VYiAKkCgtT/E+fUu8MVOo9xvm6Ce7mbONRqv2nM20r5JHY5qE+MespIsg7Vxf6
	VDOuJ42TsoJ/kDFPRaPYeTFoUk/VaZ8MM3g1rkc76sXRoHcMA7D0XAhw3sPU9mGKUJUfqm2lmnu
	Q4NmSFtYuE/fgGw9a3Nh/dgmn/FGg+XoLTAYwYqNausH6qqzwZ7J3sUhBDNIZoBu7cMoe8yhOie
	8CiK2N+9dkZ9UKvRmGCzUVCzuzT7YVuuV301kTUZreNmU7e1kg1nc+V9ozQUo8e7tnTkLKeUAID
	0+AtQbMlBtOlRGZ2IHPOOuyws8a55JYWp63A7p9jCzdwNyRRWVg8FmV1AJpL5bQ6vO98BO6QCQx
	1AvSOPupWh+IK/8845qDM7H14flF3B7tgnoJ90uNn0OANBGA==
X-Received: by 2002:ac8:5f95:0:b0:4ed:70d7:aa5a with SMTP id d75a77b69052e-50e36738d99mr63423681cf.25.1776469244648;
        Fri, 17 Apr 2026 16:40:44 -0700 (PDT)
X-Received: by 2002:ac8:5f95:0:b0:4ed:70d7:aa5a with SMTP id d75a77b69052e-50e36738d99mr63423301cf.25.1776469244210;
        Fri, 17 Apr 2026 16:40:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e10e6sm816761e87.40.2026.04.17.16.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 16:40:43 -0700 (PDT)
Date: Sat, 18 Apr 2026 02:40:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Erikas Bitovtas <xerikasxx@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH RFC 06/10] arm64: dts: qcom: msm8939-asus-z00t: add Venus
Message-ID: <37poakqgqhsuavvrm2dyzwk36syyq44o4cfdsylkzwsupbh2yt@ycdvyrxgnrcs>
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
 <20260416-msm8939-venus-rfc-v1-6-a09fcf2c23df@gmail.com>
 <0a5f9bd6-d3ea-4819-8be3-cc5a06ec0339@oss.qualcomm.com>
 <ad482bdd-2fb5-432f-be1d-dec25d9cbf5b@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad482bdd-2fb5-432f-be1d-dec25d9cbf5b@gmail.com>
X-Proofpoint-ORIG-GUID: _ayGVaImDKCMBXiK-srY8s7x2YAMG2W2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDIzOCBTYWx0ZWRfXyIsHFFh6ELHN
 DRHmTlW/OAF7BNOEZL/lFHKpVEW+9wcxIEAo4nq7H0OZTfihdGZwjlFuZEknzsLLdFK624Fs9Tn
 RvFGE+s9brQmHl8k/sdkty79+1Tna87+zz1Yb2oad/82R/hlSeNGI9p2BxTk86uFI0YUj3akISu
 TDDJgAk7RbNjfURs1gCCR8JJu0NeCIHIoLWamWMzIjO781FV8y4gt1L5ZOKWj7+uHsAzinkOjNo
 yPSC8TpinQIaULiVDboc5PtEmIjC5dBWCh4n67u33qU6QYq8oMGwE86usRc3Ez65VzdTiElWb8M
 KSfVXDjQ2v11LkL3CF09aItuJBu1QL6PK4953V4ZV6xF5D3C6xaxSKfXCDnq+KB+Yzvafff3BET
 1hdFwkD2zTJ6n/hvsuL0hAedtDUECRiLqX+I5XESJLQ0AI7dBxjNzcspu/r9141mwFbvBornn0u
 duU6byOan8phj/Udvzg==
X-Authority-Analysis: v=2.4 cv=X+Fi7mTe c=1 sm=1 tr=0 ts=69e2c4fd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=OHVz5xcZLeuoOJp_SuAA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: _ayGVaImDKCMBXiK-srY8s7x2YAMG2W2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_03,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170238

On Thu, Apr 16, 2026 at 07:57:30PM +0300, Erikas Bitovtas wrote:
> 
> 
> On 4/16/26 6:17 PM, Konrad Dybcio wrote:
> > On 4/16/26 3:43 PM, Erikas Bitovtas wrote:
> >> Enable Venus video encoder/decoder for Asus ZenFone 2 Laser/Selfie.
> >>
> >> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 8 ++++++++
> >>  1 file changed, 8 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> >> index 90e966242720..231a3e9c1929 100644
> >> --- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> >> +++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> >> @@ -267,6 +267,14 @@ &usb_hs_phy {
> >>  	extcon = <&usb_id>;
> >>  };
> >>  
> >> +&venus {
> >> +	status = "okay";
> > 
> > You need a firmware path here
> 
> When I tested Venus on my device, it loaded without one specified -
> msm-firmware-loader creates a symbolic link from modem partition for
> firmware. Additionally, none of the MSM8916 devices seem to include a
> firmware name. Has something changed since then?

Us becoming more strict? Or more caring? The default file paths are
supposed to be used for unfused devices. So if they don't work with
yours (most likely they don't), please add firmware-name:

firmware-name = "qcom/msm8916/Asus/z00t/venus.mbn";

-- 
With best wishes
Dmitry
