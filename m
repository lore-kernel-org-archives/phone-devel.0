Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6927531E820
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 02:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773629857; cv=none; b=heBGmyC764dkOqUnGEBu7itQIQ7pYvLOQ5bk6SHzAziPCBMEGI30EPr9I5eQXYzMwNb3/6vJM+LBERk+xuSOta9u36PGZCxkW1hR8ggHGJLDHthzn7gYn0f4mfGnk6bBIAyO+/Y6CMPl3i3KRzIaFm4jnmfuvPSxlTvdkrY1mAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773629857; c=relaxed/simple;
	bh=39+mO8Vam2ZMleBYj6pCXFVbX+AiJnRBzl/jLDXGNc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nnfyd77lhLEvtMEvG6kEFH0QhEEqOTout4qgaTYS05kPeV5EMUMZB5UIS7i7KghkjZTz8KCLCp1UMzYksf8VAlVr+r1JNSOcALQnRTQzprpEMPj+jymlJQDoFZjk31jzVMybCo7Y1WBbfotFo3URH/hDWzvSzxTQH8RQrCUWYGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nql2zepR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kRxWVA1h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nql2zepR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kRxWVA1h"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62F6U2FH2043549
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 02:57:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9EKqx59suweTA6E/vTasnn23J0k/ujVgtUKj81FsGNE=; b=Nql2zepRVZVY2+9Y
	N57siDhQZKIrOivRRvbXxtFxzS54zSmS6Lqj7WuAFIlI5tnUkAaZ0jitFbHLFKaa
	C6zGGLiHUXsiTVhxC8ids8w+UIkqCC7EYEubRaAIXW3di0FJ09OwVuhqr3cGevdH
	jAieJw7g1DNnSBV1HBmDORrfFH2CE/4k6DPh6XNGG79868WMJ8OKNK4dsAc+ex3G
	ZZowroab3pg7rYf5SwvOYtg/1hXAiJxYPGYeL8PlmA4uMll5Vagk95s0Axfht+LA
	1UGqvL1SA0gpYO+XeigRGUB4lTFzpH4nhA2u+YhOomiaeq3rQ0wYv3IF+dUo8Uz8
	/BGhBA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw00bbyyb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 02:57:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd91c0262fso3051148985a.1
        for <phone-devel@vger.kernel.org>; Sun, 15 Mar 2026 19:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773629855; x=1774234655; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9EKqx59suweTA6E/vTasnn23J0k/ujVgtUKj81FsGNE=;
        b=kRxWVA1hyuAvPlot59Vt7GYlKepWXWIpwKXgQB//40RhoB6E82SiPKW4aQaAS9sIDl
         gOKJYwn/Uk8rtNwg10xgjrfMshuhWa+7TJPXdPBDaM7KkQg8apQUCXb/hPdzVWQWxCC3
         ivWMu6/Br/4D5SXcTMKGyHWG5sFtsJ2SItjS6FWZ3o21tS71n08sCMX9vjswCmEI9+am
         SETuonYXEOGFy0DqZZhFUq+n58Rxtd2rcEGGgetTsbk396gXcL2CNFIBZTMZJkl5R2fl
         yeP7YthTaeFnBrr3rkf6DzqkP3HC7FvVH+WLY54Ael8QvGGr8x5nDzZwj9gmjEY7Xptl
         UIqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773629855; x=1774234655;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9EKqx59suweTA6E/vTasnn23J0k/ujVgtUKj81FsGNE=;
        b=UcT6Dwib4MdOC9w7JjvNK3Xk15E32J7CKhik9pn1Ssyd7DT/sGeNkXYGMprc0gI2LS
         bCroyjowF9aJ9kJs7H+770J+wvmU5XcGob2hCS11vQFRU/vOUQ74d3IyV95buKzPRdKb
         PEoNfKvV3tVobqLtJ5fUiNLuR4DvkEu84LXwel+MvorSc19wfQXd2rJ8Sr39e2RijNUl
         QlonofhToAOjV93mGWEk5zVI62jj9EDAUfZF+e3OYSZCj2fKx47zQpSnWYy31UdNg+zO
         419Z45oM2Qbkf1xC0QSpFRI+MrMEEFIXOMxMZ5YgByVjWftFvBQFTxbD4sxWCHuu2B+u
         hv1A==
X-Forwarded-Encrypted: i=1; AJvYcCWYdQn1gmONGrW0IlBJSzyGcNm1LLb6K53piQ/uONyGLTQXnCfXO4Q5kaPCFnhpQMgHo0/oFVV6AB80JQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaKO2tm8nq5oUPBkoZ6MwintAyHxabsin04bQmYXwpc5POSSHN
	srb1W9D5fKAb+BeA2muNCZvWzUALlKLzGTp+Gqad0ScrmveqGXojGEogdg5zLcUKrE57LivEPqu
	C/lnynoMYCzRlIcVp7q52gxqJtBS5MRgEQVt0ZJ0XniROsTecQpsTOV9oMlVberzokA==
X-Gm-Gg: ATEYQzwy8c24czdYMfdwN7qd+ocTshmvOyeQtj0Gk+GCpDgYTzIfNkZ3hKTOBhUssrq
	56iKyAhyuZa68uf4kYOae7TkE9R3QaYwMF+fKoroE8iDHDgR0suPwIP+y2LNFcNCYuQPednMQtq
	ROEXKKoHdS/k/YX3hk+w5V/FaeVbTamdMrnYDUl/ZuR80zj5sVTu+ccyCPLgu+/PJj64kD5idgh
	RP7DoapBBURUEtgWgGkRJFs8UWdP44OyMmV6Z/KQ3vpK7KuZLbUC2G1ELVzOJkaDPiKvLGt68oa
	jheh1dKKBXoOJsxnrv18z3RL3gMSM2hkGzT1TpeIgZq7jcnUMRq9nID92SG8BfGoR/54w6jI/dJ
	xZT1afu9KlWaHWYhNfXqkNT8o7Nd3HXb9v1H6Y6nZ07mH6QE2Vew9YlFIoSEulRkeQ+uaacgwzg
	TcK6oVv2AwnkfNHIclPWv04Ka+sZKqstcUspw=
X-Received: by 2002:a05:620a:4713:b0:8cd:98d4:f175 with SMTP id af79cd13be357-8cdb5b1b150mr1493228085a.52.1773629854701;
        Sun, 15 Mar 2026 19:57:34 -0700 (PDT)
X-Received: by 2002:a05:620a:4713:b0:8cd:98d4:f175 with SMTP id af79cd13be357-8cdb5b1b150mr1493225985a.52.1773629854267;
        Sun, 15 Mar 2026 19:57:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e5ed6esm28647421fa.23.2026.03.15.19.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 19:57:32 -0700 (PDT)
Date: Mon, 16 Mar 2026 04:57:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: David Heidelberg <david@ixit.cz>
Cc: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/6] arm64: dts: qcom: msm8917-xiaomi-wingtech: Add
 goodix touch
Message-ID: <a6gg2z7chcllkytsrlvpmcbtaolwzhwwj7rip2eyvgxmxgmexu@msh4z3dkaztj>
References: <20260315-riva-common-v3-0-897f130786ed@mainlining.org>
 <20260315-riva-common-v3-3-897f130786ed@mainlining.org>
 <6bf1a210-6597-4d97-9871-ff82b5aeff50@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6bf1a210-6597-4d97-9871-ff82b5aeff50@ixit.cz>
X-Authority-Analysis: v=2.4 cv=IsATsb/g c=1 sm=1 tr=0 ts=69b7719f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=OuZLqq7tAAAA:8
 a=-dtjKa-qKq3EqHSsPZ0A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDAyMiBTYWx0ZWRfX2oXsVhAwCBx8
 vGwbFY1uX6/mui1rCGkMmLyS7CIacVyV5Qf35OkrifZVNt7tT354ad9K2YajosSuPYfYA/9Z7OK
 /bCiWykiZiNWvWy7qn3miBXXgUo8laTbnwGpIxQEr+sjC96Rzm5lK+UTigYNIb8+/lvjmnplYwz
 YrzOaCZLb0k27ya3M0SW/qJ9T/of5tPh0lOqJjympLG1y1xJh654F6GZDZDec+MXILwRW6seVXz
 6hEXA57urvFm5dxBSUelVikyuQXFsN3sOTFjhM9y1zo1ALWwIIDdPNkCMIaoTphSMz1QBDPSTzb
 nGciAiPXT2x/ZqRMR3mZGO/lAcYkZKPiSQQ9VchBu9317S9s5eykOoczxNhsDlAav16HDD6rcxb
 QksfARD+6tLRChjKhxTXLfL7mgC+bKMk9+KKWWkP8gGLCqVS1+PJxTY5mAnlipbkHSNQK+Bdnv+
 3JA2rpG3KH2EPf1OrKA==
X-Proofpoint-GUID: TSB4tFpZpEutetG5sLNV-0TqT1ACy9Xt
X-Proofpoint-ORIG-GUID: TSB4tFpZpEutetG5sLNV-0TqT1ACy9Xt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_01,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160022

On Sun, Mar 15, 2026 at 08:58:01PM +0100, David Heidelberg wrote:
> On 15/03/2026 17:26, BarnabÃ¡s CzÃ©mÃ¡n wrote:
> > There are variants from MSM8917 wingtech xiaomis what
> > are using goodix touch controller instead of focaltech.
> > Add goodix node for make it able to use touch on all
> > variants.
> > 
> > Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> > ---
> >   arch/arm64/boot/dts/qcom/msm8917-xiaomi-wingtech.dtsi | 16 ++++++++++++++++
> 
> The file is not in the linux-next or linus tree.
> 
> If this patch depends on another series, it should be stated here and
> preferably also reference (can be done with b4 tool).

It is added in the previous patch.

> 
> David
> 
> >   1 file changed, 16 insertions(+)
> > 

-- 
With best wishes
Dmitry
