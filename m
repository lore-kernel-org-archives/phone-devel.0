Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38856231A3B
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 07:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771313864; cv=none; b=S5P9m1r23l3y9GhY90wOKSwLGoV0EYijoMEI8B9On7oOwaP2et2/xP8JavuB08iZmqRtNMK81ukw7IqD9CaoJY/TTBsKSMNGc3wMryL/OAWCC/m09D4lPH+A+3bku4ny/8Evs+zIc0C30oef0taq1YF/b/ZVu/DgcO9USwnui7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771313864; c=relaxed/simple;
	bh=pkL7neZhdXiS6911Oghk8JkjG2VoWdHSi19S+R2hXDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LTe1CJNmPQGdXqod33jr04QOS+mn43yTlV67wlqU7bmf8DSTOivCnywaYoip+WNhOhU4ugQMU4WvO7GRuuYkVyVvSZzMc/QmDx6tfT/C6NtNZDq07w9k2bNVn7sbsiebO6IDXDyino4RnLqDxxDyzTPgX1MAg2L0MAs0yW0cVWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lJggXVMV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tl8b0lxG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lJggXVMV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tl8b0lxG"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GNx6KF1787522
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 07:37:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WPYHukQZC9sgqwSj6rGDXxrk
	OZMyrev9mk3G1zXEtnA=; b=lJggXVMVdBbzgMdMGVZlITZDjtQ2jKWhiVYET+Uy
	7gH5bNu3RTc4W1rXgYdrCJ6q7MYcdsoLGTBGF9Vtt65gcyqcKv+YUTQ0DJT8+vyM
	XhVZHendZZM5A6kWM1JJdC5qUOp03AhErcYKfqztopmGQPd9NmtY+lO9XWGDCkAj
	yoth2ngXl0pk0oYARJTJm8Z5DsguNGiBfvH+Z+5hiq7XhiF1J2AD3tF+TUCiaDns
	a52C59HjNZ0yJGWPMqOHxMdsAOmAdm97xRqShzEyhevlKq4R8Q3xbPEVeyp67olE
	U7+V/sOKzTxBr7Fdn1/Ezg6rUOr2s0v9Jtt3um05aL5kNA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc7ap1djm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 07:37:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71655aa11so3259603585a.3
        for <phone-devel@vger.kernel.org>; Mon, 16 Feb 2026 23:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771313861; x=1771918661; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WPYHukQZC9sgqwSj6rGDXxrkOZMyrev9mk3G1zXEtnA=;
        b=Tl8b0lxGVMLNb0eDXjoBVGD0tURqPJBEkL1muWFOIIcl3XvNeB1KstU13HJuCnu+Nb
         tYmR2x2tvOtB1zw3gSdpKAeqjr6+5doOV7gjar7ZaNJJplkb01KDan7QVspR4HZLb2Ap
         KoJwx8hfwVcfPjKiyb6ux/hvVvEHEb28yTpv8UzNwEpyg8Dtz7ZrxLaXAbkzeHvDdKHd
         ERSsOGb9GriYS5M1XoYr4qRGWzDWIl3OZL38w/a1WbFhk+qnqjZofRUjUrxhOxvyvt5L
         vVDF1W0iWgnFLQZ5UxeW2rigYMkmSpvS5zvoHuFD2Y8HB2gcVFVCy4mgrYyhU16u4QnD
         FDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771313861; x=1771918661;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WPYHukQZC9sgqwSj6rGDXxrkOZMyrev9mk3G1zXEtnA=;
        b=BIHz4AI2HuYEfALgTKig/MbVfOtudFc6bvYwxFPKyEoHGnwcZDMmVueyJO3NlrWupj
         yICN+IyHzvIluTF2GIj+m3Bw4VDGhQDNc94qWWrM3LRKRYWhoU2gtKWPqFbzhCga0JCB
         /rrOTNucSnwT9XMHNBzuLqqV0JzNjkmZa2Y1jg6xnicnavZj0LF7uBp00kM6VG+R7XAS
         WGhhE4LYkGddWHAeoEH41zTpqyIcK9EBdNFl88T4Jzr/T5w1wktRzRI9NXtrtv9G5K5w
         QDiLZcSciCXvDAfRD7YCua4SlfSPxrhFdoq6OEgQ1injgQKdUgvlmQyiZBhb8jr8xlwX
         iy5A==
X-Forwarded-Encrypted: i=1; AJvYcCUIONK2lczoJ3Aag/vWHbG8PkpBBMcDWkLkb3WseB0uIUwc/9n1Jj4/lVqG7TVYGvcwFNTKFIMZHtS0Jw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWCKE2E6W5GRsaXsgBj0lLThzg6PKgjSZ9d0p3hxr50Wmd8gun
	O1UxJkadEQUmMLQlqkQW2TVq/zbW6vB+8DrBL/y8HN1ha1E4XvYQY/jBpB0Spysv7GG54oHM/Yi
	MlIkTeIJ9dyj9xSTpzZ8U0msDLOWoa23SZ1aYt7Ta7QfEDf/Ijctj4jBK+gO3qcevNA==
X-Gm-Gg: AZuq6aKIecfznsLUTTMEksHh0jKW1fQAmzc8B0yNBcyLUjuMoHJc9ivTYGeXCA5HNZU
	eVtzbhNorVnuDTCy2kVGZLRag6c+B9cDNvsVUDJloULMwmGtHBYzerEwHCGdmwdxUW8Ee5kn586
	VrR0HHXJniT1rTUl8MNFrAwz4JfK5kZXxwo4RmU+JtP7LMzGNmIDslV0hr7UVk1ETEixyBtWsYp
	1vvKTYclFdyU56q0xeuucVV8/vxmA1QZ66eeevd3pVAwNx97NbtleSs4l0pUQnUzt/Y0+Mv/J8P
	MZOACjHOUB5Vlor6bEd2O0F4uqzTumxXBFZiBvcmgCvR4D0L691+Ao/zsjtd94VjIVNHLn9tM7+
	BsiG9PIEqiqVS/6afEjL7tvFTfjgeDB37dZGHajTM6+IPcJPnODhNq0J1Tf4AP9BMZw3LUiXftc
	C4tCZRDJK3TcQrinsJKF+8dxmYRSUgIjGwb3I=
X-Received: by 2002:a05:620a:698b:b0:8ca:4438:b8f4 with SMTP id af79cd13be357-8cb42461865mr1581137785a.67.1771313861543;
        Mon, 16 Feb 2026 23:37:41 -0800 (PST)
X-Received: by 2002:a05:620a:698b:b0:8ca:4438:b8f4 with SMTP id af79cd13be357-8cb42461865mr1581136785a.67.1771313861138;
        Mon, 16 Feb 2026 23:37:41 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f56a476sm3699312e87.32.2026.02.16.23.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 23:37:40 -0800 (PST)
Date: Tue, 17 Feb 2026 09:37:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] arm64: dts: qcom: sm6115: Add missing MDSS core reset
Message-ID: <s3ym5ua3ppi7qmkzrlxmlzhfnikeszyubmrsrxfyormi4d35c6@5v63tfvt3wmr>
References: <20260216233600.13098-2-val@packett.cool>
 <20260216233600.13098-7-val@packett.cool>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216233600.13098-7-val@packett.cool>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA2MiBTYWx0ZWRfXyv4SNCNkLIH/
 RW+UewfjI2cli74EsIO9065DYcJ/Jnr3gRvJzvdmdhzFOpQAsVAiJwEuhz5GMcpy1vpkEB1skEB
 2IUD4nVYUHrWZ0HK10Vjhqoa9gmXkv5XdoLGH+ttPLZnLe4QiQ6t7stU/tFtteuDAQjHjg74bXO
 GjGuKkkFWTeUaHXK09QRIss/HV1oPrfiBpI1QRDgfa+OQUAWg8lvqaE87ySx8stmmKr0hWVzW3X
 H/wG6vyX5OHZAttCFOSCWwLzjz8uN8eJSs2leK8MmZPOM0wTXHrEDgs0E/mBLjuIfLTsHfRj26e
 ddcreMNvV570yQ11NO80rEserR7TMIB8hC93GLIpRxDPAExsC3BH7k+6I85denFCYFxAfAIMwpB
 +wmhNG/nq2snJOoPlFvd5MX10Y/z0YHFAIBlhapaoXiQaWkICCWRbddFm7nIErdVjqp9a4NLADr
 L7lgC4YMtqiipOWvX4g==
X-Proofpoint-ORIG-GUID: sMHzkkihETt5AmjFT-aFaTc7R6Ub6XxL
X-Proofpoint-GUID: sMHzkkihETt5AmjFT-aFaTc7R6Ub6XxL
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=69941ac6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=NQfNVa4L0IZK2tGiTpgA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170062

On Mon, Feb 16, 2026 at 08:25:23PM -0300, Val Packett wrote:
> To make sure the display subsystem starts in a predictable state, we
> need to reset it. Otherwise, unpredictable issues can happen, e.g.
> on the motorola-guamp smartphone DSI would not transmit anything.
> 
> Wire up the reset to fix.
> 
> Fixes: 705e50427d81 ("arm64: dts: qcom: sm6115: Add mdss/dpu node")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
