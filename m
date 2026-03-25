Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1D9386571
	for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 22:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774478574; cv=none; b=ORiDQLm5MmBD/dpsQgD7OmFccmeyRD3rUAozMhQALcj/stw2FRA44fgKJtr8Pm/BzOZLDK2UV3FoBNKPcna2gg6McIm3lkCYd3i0dUljAyYFcsrJL+TPEU2beQeT3F5BBYRaHmBWTmI10Qq6PUDPPMp4GnUNYSwcuLg91+LpXmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774478574; c=relaxed/simple;
	bh=2Zv6b2uFyPwk92Vrj2b4m4RCN3u6OwSUTKvaWzzk6gk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RqsSAIioWkRkz8hE0vFTuC5jU5jX15nCe2EOC2H4Nn+kjLHhpdQcgNMa11JoKdmnfgFvIhRQ05jgWDY0N5pBP266fpHWw0HP1A+ZeZhFacnzg/fbatURXLfps5cBgSc/ioNLHju9oBho1a/btXQTLySguN+dwaR0sT87B6fud5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LFJVtxNn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SnVkyYGO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LFJVtxNn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SnVkyYGO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PKl1mZ052587
	for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 22:42:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mcP+C5mmyp3mXG+oZ5U13jAT
	3Ccsoj1xoxf8jggQrtw=; b=LFJVtxNnemQhCUukDOSuy2mALYTo/ynQnUq7jyD4
	/UsDzSEA2cJZRsRRPBGi1l6t0Bx3PfTvQFZDU2q164M+PA5JDOEU9heY9HTAHVz9
	uu7/MBhUH9YvPiF2by5+1iZE3GvYyzD0OfMUunRdbs4jrMUIY4g6e1TJQSW1N5f5
	JTxAQWaOKl/5vM5TxWQrhZj8lNNcsBNwrAaWautqrzSv8/EcibgyGtPfkrFE/rKL
	NbPF9DKdjrjwrs27TIo9EBd9Jra2ekhQRc6c6G7VT9Aa9fRoarFtaIKFbT0/03Dz
	Y7DLikqUWHwPk8lQsz7SdU3QufPJmHOK9w95IgeTRPmHdg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4q1t0amb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 22:42:52 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89cc5305180so11818196d6.0
        for <phone-devel@vger.kernel.org>; Wed, 25 Mar 2026 15:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774478571; x=1775083371; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mcP+C5mmyp3mXG+oZ5U13jAT3Ccsoj1xoxf8jggQrtw=;
        b=SnVkyYGO+FgXwjyljnITNcNGvgc3QawI3MSiCNObVSUQN3VrFmneUWx2yWidvxILc4
         ZPsKfk/fvNh2V0+lWatCS3qLZh+IBx3b5QLnRmwSbuGkiN6566V2HwqyBh7KVAtTI1qb
         r5HX1zgLM6a/se8GiW1LJkwtbUw4ZaJyldBXAYCFc+O6sjZJg+t5sHN3E+NOrWO70cDX
         z1fYjctk2HfoCr8/J7iAJUjwrNSnd4w2fEickgi4QGnOQ0s8YN99+72YN+xtbWPDl5A/
         Y9rj/Qlj0xR/YAYbi7qYDgy4lPkajpU7JykBmVmIO+7PjJtJWMUOS+/mJPBs9lh2RDgP
         znWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774478571; x=1775083371;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mcP+C5mmyp3mXG+oZ5U13jAT3Ccsoj1xoxf8jggQrtw=;
        b=BIQztqCVx0jWd4rYIffPcZ6MJ1MdQUBMYlWn/DID4pQccNLb28AVqvWSCMs0kDrUkt
         XPBqH4sD5TrK8DgrL0EHNeLuLNjds2EqrM2useJjTIAUKXLGCvg+Luvch7P03iftTPa0
         UuPgmxsZ1h6oabhVrtcFSyZM2G3H8CHiLLo/j1Crlf52oMInV/W/JRm/v5p2vIl44M5P
         f7uFDfuRs+8zYFRfLi28jzaPfmkFGbWZSaqI2mJ9cTJWj0/Z5FaRuZn36nmkIu3hhbpE
         d3CQT35Xkg0bS2SFfIiS24v3m60bgQqgjXHeqqJpNjtumUHjQDJX+/SvoAxLsWf9t1hu
         thbg==
X-Forwarded-Encrypted: i=1; AJvYcCWBKkUWCe03C9Da9CuxCoZ4FgbFQbsnICn1SeZpAjIv3q1n59LC8igF0cDEO8JSf2UwRwJLM1G9KxajDg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8xs5+KN56VEU7eg9EdmSAnAtrOAlmeW0hL+otRx/1klHHcKtf
	JJmq+QCUSaoaKQP4gItlYCFsJbuXvFEZYeQuN22CmTcwnOYDBNQfPwd+pP1OkaJ96m1bvECXwo7
	/huHKgkgRI2nAvhJk0WbioJ6J/yzx/tKByHZ/mxw5TEGX9zgjAgyraNfCav4QFKX8/A==
X-Gm-Gg: ATEYQzzHr5/mS9mPBhk/DC+LlWZhx3aRO21yEp+ngmzre9cvsQjgA6PcjM1exnyJQio
	ApdAvFcpyWSs41XM0ZCWk/h9znCIxgaNSm9/MPAd/v74mD6q2NyXdMaNRteS9c3EYoQnpcjo/vC
	886TOCd0SeCOxsgrN49vVA7reDJRBiWiXlGwmIEI0rkLtbKyjDywy+tbUaToO9EscpRuaH49XUZ
	lCPRNCOBoTAwEclavcvhzlxOl78xDWz3p268LUy1iD6ImPdGzUytRD4UDlI9rMQUB12F/V3XBLU
	fx64qPBg9jM5FJ2dE7HZOfiIDRcnGsZGc6yNtSHt9Wb+9VVHKS4HAVwQTHSKssXUCmB9HtlsX7/
	PbXJ2PyARrzXW9cASiFjuW9uD867Xe0D88lt48QlM37821K9yLHTqyP6AH5AMm16wbl9MJPz022
	oLQ5JXFnpFgJiyyjpbnz2rn8BgbtFrYX4e1Ok=
X-Received: by 2002:a05:622a:15cc:b0:50b:3be7:b16 with SMTP id d75a77b69052e-50b80e4b3a4mr74064921cf.37.1774478571625;
        Wed, 25 Mar 2026 15:42:51 -0700 (PDT)
X-Received: by 2002:a05:622a:15cc:b0:50b:3be7:b16 with SMTP id d75a77b69052e-50b80e4b3a4mr74064551cf.37.1774478571250;
        Wed, 25 Mar 2026 15:42:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a069903bsm165984e87.76.2026.03.25.15.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 15:42:49 -0700 (PDT)
Date: Thu, 26 Mar 2026 00:42:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Biswapriyo Nath <nathbappai@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 7/7] dt-bindings: clock: qcom, dispcc-sm6125: Add
 #reset-cells property
Message-ID: <mc7myusw7ehmcgarvndoylyhqdplgr37w7b4nttj4fn4ygw667@52nfrzyejqwl>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
 <20260325-ginkgo-add-usb-ir-vib-v1-7-446c6e865ad6@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-7-446c6e865ad6@gmail.com>
X-Authority-Analysis: v=2.4 cv=e7cLiKp/ c=1 sm=1 tr=0 ts=69c464ec cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=TIRtq7bqiOsBIkxYvl4A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: Fyb1FptAP79-smrjp4HYbYUkzEyB6Upb
X-Proofpoint-ORIG-GUID: Fyb1FptAP79-smrjp4HYbYUkzEyB6Upb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDE2OCBTYWx0ZWRfX+D4xRKozHiU4
 /N1p7O/Yi5spbxDtWBzpYAMJ+3Te49xf3tB11eux+tjypXx5fmXhNMIh0YAsnRzlUQEY8/cjH6x
 nOhlmlSjczrRnzffWWI2+gTp3ulnDunperdd2kzoL16Riwl+MQQdPdSLua8j14obi4rZ0qIxf9K
 XrGiypOyNI6l+y9v0zttCXIHhqYbBv3PlFPik3IA+5FrfpwbJRWL0M6qMxTWxeXky+OzXdm6v6F
 ugxV1uvy4OkgSee9R9jJlkddJLkC6W2kYxEndrq87ZNoIw5IkRpRdIVL4cocSztPgqd0exZgjcC
 WoEG/8LGaK34tJ7z5c4UVC+PLFG51YRS/nYo0lVt5oYIgCl07XmVXd8QuFXFTfwJLUD5tENH5Cz
 C32VW5YzoBRQBbSNyOmrfQR9Wk6ATwO7MmRIDDIw1kkbs5yT+JEyQrK0ieSfSbm/jFAJqeSWN9j
 g2j06+wN5ZwzvKNCw2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_06,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250168

On Wed, Mar 25, 2026 at 06:07:30PM +0000, Biswapriyo Nath wrote:
> The '#reset-cells' property is permitted for the SM6125 SoC clock
> controllers, but not listed as a valid property.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202603150629.GYoouFwZ-lkp@intel.com/

Fixes?

> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

-- 
With best wishes
Dmitry
