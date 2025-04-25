Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD92320E710
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 19:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745607805; cv=none; b=HVpg/QcXZvtlTnvZOr8Fg2mZ3elj10E8iGPBFMs+iLLlmu0ohM4xYa0eWAfS3SoOiXx0NYaMESUIGKgy3XhU094wDr9QJz7CYZnSEci96Tr7MBD7Wzvg9Lj2Qe2vnrT8Wkiyz9REAjSabwgx7dY8MSbanMKOTUlaprAe3o8mmbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745607805; c=relaxed/simple;
	bh=5mLfWj+jwzO9e6XH5KOBOGiPhIhid9kotKcL09TSRRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PSetKNGzjwUZ2KKINjJXogr95V07t0nMZmU+EDuBmZX9iat/AIJAn2EPLXEozYQMJJe3du1kdYflkTN/aajNz5z3L9SHd1kobLHXNI1dwP5FUqzdF/GXZ8FVKIbAtxCQNYtlWibq5jkstRyqu30liDLOQv09ODjEURlZ9G9ajLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gCmfGND1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gCmfGND1"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJwsp011503
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 19:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d+OQsF8WR7J3ezadmXnGj6/J
	nTpBzTLVUrnSMduU/PY=; b=gCmfGND1WyskeqeTPo8rwftpd/r4wPc1u/mM3He9
	bWUJ3lH2ZBI/phlFp1WSu5xVJ7/DCClDgWQFBtYDtOebx2aBXY+L6Kg/C+JSoebl
	/OElJDXtP/z3Q0Ut80KJP18w8F3i2Hc1yxZuMDjuHENOw3GdxhP0/33OhIh2dHRW
	ORLNZqN91ZxJwqMw1qmRNZ6oA7c+YC6VGaMnoLbxJYQRyaR9jnh45EBDZ7LXg0Ku
	RyhbWB6d8xjn10Qo/N/ar6kcWfemIpfixTyFMyBdV+tQtDBewr6hdVoRihjh/Chd
	SJzf/ig/sxz3VWKF7W2wEtfb8f1UB4qePBjzJtT3zHqQMw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3syuc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 19:03:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5c9abdbd3so247756385a.1
        for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 12:03:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745607802; x=1746212602;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+OQsF8WR7J3ezadmXnGj6/JnTpBzTLVUrnSMduU/PY=;
        b=TKHmk2WwSLRmtww5Pitr6cxmWqpKNlJDPHctgqG13vpZCgexJfAUB3WhApeY2IYbU2
         3Ljm5L6Gfuq9VGMfN85vg0K9/xZSxss5mV7OlEXDoJ1H2UILBeQA3/TAWU61Rg7Gso9/
         i8lkSlc6MVc+xrLyI9VqJg4vhU0+d+NBssbCxfNEJDONils61YioLM3xxU1uK8LLe2ZE
         0evrAy9naeHE0rQQfYFNERSjq0w98f9/dpMtwxLH3C9xl+08hCPjEcvNNE5fyN3WE89u
         70uM1ydfx0WiSYX9dgMjy8M45dOCYMf79r8iaWROyNjLhPZ9PGaXWxSMSrxT4g+G5+ws
         mfkw==
X-Forwarded-Encrypted: i=1; AJvYcCX69fta0CKXRsnP6ISzc+yyTc6dOqKzTBuHRtfX2c22dPzEkz7qnDeP2nBgaPr5Zn5ZK4/PK3sFBZ4dGw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9jIzJv4t3bs6BXBpZAk8Me1bnvMyBUXRbQEIYKlpGuK8xnMic
	SOJMm6Vev+NTBlF5WzzS+M0EtqBhsYQ3ia6SpPmby1q7zpLQwqsPUMF5BftlqYsMA2sHceFDDEn
	vnhWWDX8j4kXn8NG0cRyguQLBTekusEj2FNWmbiKWEn/Rb5UOfHyV54JSSuTCxA==
X-Gm-Gg: ASbGncvJ7OEStwJFL95quuDAx11Uimu1GDrjf56/2hu3W3IE2qwjR8ECcrrEIEsTmAh
	GHWzNV2lkegrLOcMVBoRriSCrTCMKvfLT4IU+tn9OuJjp9UcHwRLsTmtHcgHv1/0ZmRXZAnMLwA
	wS+XFCOfoUUI41TxV450enSuFM7qrnlPpVi5cXP80h15C+xda7NoTE4OXbT3WxpHDGD86QlM7bx
	NqOKrhRw8+o2rVs8/AoSwEeTG4m581hLMgAIeWp5g20Mw/d2StUcFxqR5pKC0kHszZ4K49wxrtj
	XqKz1hApBcNikzxZpIwKvKmg1N7TuSAA/TTprKwwR1EC/kRYwosAZvbz2NMOVEpPbxrPmwarsso
	=
X-Received: by 2002:a05:620a:3712:b0:7c5:b909:fde1 with SMTP id af79cd13be357-7c960718fd7mr529027285a.25.1745607801870;
        Fri, 25 Apr 2025 12:03:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6pRYAFM9obH6sLDqc8iWZTDFSyA63+5Z92vfE4mhmS0Il4CaGvhCSgEYk/JEQXTzgN8c9+w==
X-Received: by 2002:a05:620a:3712:b0:7c5:b909:fde1 with SMTP id af79cd13be357-7c960718fd7mr529023685a.25.1745607801481;
        Fri, 25 Apr 2025 12:03:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cca7b48sm693665e87.160.2025.04.25.12.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:03:20 -0700 (PDT)
Date: Fri, 25 Apr 2025 22:03:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 5/6] arm64: dts: qcom: sm6350: Add q6usbdai node
Message-ID: <7cuouqnka6w26tnfhdtyzo4c2jwohgy5gqyzv2yu662gvkg57g@n6amazzvznew>
References: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
 <20250425-fp4-usb-audio-offload-v1-5-f90f571636e4@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-fp4-usb-audio-offload-v1-5-f90f571636e4@fairphone.com>
X-Proofpoint-ORIG-GUID: 6nbaxIIDOR2ALHe9Yy7S6DvHw6NZBjJh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzNSBTYWx0ZWRfX8dbYML6yeowC 9wapdtQcCWquwQkVlnSwR/nWM5qNy5xRI3YwNe0o4vXKlc4Jt6SCKoORwx8IYHMIoakc/JSELmT HQSDllsfpukzEx63tfmCXeMg90kdm28Z2JLo9XYqjjiXHpavTY2B2E+h0Wm2A7MDoz+9paQONga
 wKgnjuwcMQZl7vGvefCOgemlsuvS5ZsbXOFHwRWo5klQwZTyKfRkWCNs83Xi/eMlVDvQZS5Stfu v/ch6dml7T532QF85wqt3kfNUtcO2jSpgFDw3eCcMFGeX2FGPyxIJZrF4jWinzUd5YL768CRsB6 F0hHYWvN9Uhbo5fUYbYVv6Q6JAiivKrUI8fON/ZR3p6pmpjK/3/RFms7RCOjI90vGVSehSGi67X
 WaSj7XDjmvD4BT2Pzy48sZWLPPPfZEtQbskUDCyjRDi+p8JPMl+T7kuiKbnfsvlO8dl59PBl
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680bdc7a cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=s1otzWxbid28AevFAO0A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: 6nbaxIIDOR2ALHe9Yy7S6DvHw6NZBjJh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=883 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250135

On Fri, Apr 25, 2025 at 12:44:55PM +0200, Luca Weiss wrote:
> Add a node for q6usb which handles USB audio offloading, allowing to
> play audio via a USB-C headset with lower power consumption and enabling
> some other features.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
