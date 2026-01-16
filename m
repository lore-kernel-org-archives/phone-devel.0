Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0689323EA86
	for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 16:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768581290; cv=none; b=gQgmKanJIoxUuSpUrE4A6j7eHwBHb05ZoSmgRYxSKXsgDZsa7HzNt/Cc+rY0+6cFYs0CE+MVlY6qGVEgOwwhyGgi1nGVL0y7X2kHInoFuRZ17ODQYLwqxg7c905L62TvZQoaTcqX6yf14zxS4adTISSkgDag8dMtCnVnS+S7G28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768581290; c=relaxed/simple;
	bh=e8E2A+eo/KQwzZm9O+K51Cg+TzQHkK+jR1VYjq3CkS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EkmQOXiM1Dq4f9K49cGSBLOBVAcVlmsYYeqZwA7EgX1WWpUVlYUbvPtsmS4hC25MIrtVWuhfcjAQ5yFzEL8P/W/69/nJiB1xF6z+4dkNn5nJCOXZomh5tKN1eUuEUGyKOBlbVIvv91N+O9AAHHRrsukIudCkglev8Yq8ZYQJ9n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l5oB5sKA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BQ8dWcvj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l5oB5sKA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BQ8dWcvj"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GExehm914011
	for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 16:34:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fCYKQXs+T1JIIa5G6WnDladc
	SFMG2v8SiIjUv68q0Fk=; b=l5oB5sKAR9ZIhK+VnnPwy86114P0A5VGO2r83cll
	lBZKV+vb+UvyJ5Hm6AIWylcUc5oeLj8ZRg99D8LLmOXqXOZN7KV82Nks4fy8g6t4
	3uNVPzXWlKlctOfT8gyEweBuhf/ji1TYedMlH6j7Zu8Iu1hIrGfZmV7nUeN1axbY
	WAO7yBkoAtwCge+Kxfeu4gv+GzOIQ+0e8JSRVLBGH3Xqcfn2rua5pGbJs2dN9hm5
	Y4ZfgEpovlfGLrsRpz4NBtNu2GVSMztuN8ba3QllXqFxnBN2SXnUqM6cV9LTUmyW
	37CNu602zI0hQK7jL4yxtcqYMA2nNZtilJiTYnSEjYI64Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqqjura08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 16:34:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6a5bc8c43so356012785a.2
        for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 08:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768581286; x=1769186086; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fCYKQXs+T1JIIa5G6WnDladcSFMG2v8SiIjUv68q0Fk=;
        b=BQ8dWcvjcBd8DrNp2VbiErZL7WQSngBGF20hnHv1Mxth8DyTBegz8r//0GB+0CTqZX
         pyoSQnWKtFkumvLWczVsqLYTTCQIeavx0PHfvxjQzGAi6YlqkXg//LtCoOhPM2BCBzyu
         CYZDkZQc/Kddp9J9szZlxObx+zSh0ZcGKIktzmwyastURvtdvv6gJqzk/Wo1mdgMcAty
         DhVixioWyGZYGfWmm7b6eFInJ+NnPnCsaePRDodZ2Y+6OpxEh5UL8J+9WIU2WCamPYsf
         oCGR+WfBv+XYnNFA54ByEnthjouhzOJ/GGyYazb7sXrvGzCsrcEE/o8izChm9uv8ckqw
         HslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768581286; x=1769186086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fCYKQXs+T1JIIa5G6WnDladcSFMG2v8SiIjUv68q0Fk=;
        b=rqTkV7qy2FTVGevVrCiM5YLkt+M+cKicpgTsyx9fC8anfu2UqrdYafWT3ATv8FCjPz
         kxSlxT5JpnhUiT1QozIU14kHn9YCnR0iTWM2FzpsLNZEZbr1PRfgxunx+XSEcmJx4EEL
         S7ALvbSR0GoZlM4aKHnXKRrtgVhyEZEUjBsqF/gxFAZZCGlydTQLEpbY3mQtrNtLU8t+
         oN3bJbxzQj5idp20ciR6AYGFo73+FTeQf5NbxZvdKR2bBNe13/TElAehWKnuZwtbefgQ
         9/urdWl5+NK1ZkPMBugbbmHyZyPGX8vKQRf79fA85LsI3L6gLbwf22q2NLZW8x4oAdMF
         Nu/A==
X-Forwarded-Encrypted: i=1; AJvYcCVlxiaUfONslTXg5dI7iyiXhLJgYq1CZjqSTRGsLyvh/Z/Xo/j3r6vO/zC7knS/hDwCyJ7VncXvrV5cDg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0t360jeS39hrVfoXZvBj75+LUV7bTzebl7CvtTQID8M1NxjTC
	6rt0BMrWwgaRE9DpFNN2T6Qrmqm5xd02c2myrVV3D6MaQcdMD2cidG5CU1LEKtFWYXZOcGap3HM
	P7uVDQsyMMDBCCmk/gO2Y6SAJIIUHD5RbdHqlLDffK+p2rjnxiLEcpeDv6Lc/m4VMAg==
X-Gm-Gg: AY/fxX59PqUVMbI7vO1YcLLQAlTsajVKUCoAX2wGWiaEVPch4N19FWDjc07YqfJnJqS
	Aec9LgUuVDNZP0NybAYknaKQMnfc16sAbDmizLUMyxljH4JPbb4EQuzD1LhYjocV+NboMBvJNlL
	91xjV+6FIyfu7yk8gnwoY2yjfYpY0yJKb6QgUMlrRDKNvBh5HJeq691O8ZKu/l5ahlNXiQ97+RP
	v96oTVujHx7BEVa7Qf55zLdwithlLkPgVucT7OC+gUuOBCUQwLsBazD3suw4Qx5d8+rdOmHY3ap
	bppMpU6EOY3Z+IGvCnsVtgXLZK0fgoDgybg1R8/Ndo0g6pck2j/CbVysCQMG9Jk1cPBNYNdc2uQ
	ICuVlJuI/7irm8U9HjEaaOGBxfjx3TMMZ1LhnCOiN0EPBUo76RFpAd8Qnwy4I6hTOzPKJZJ90s2
	60Mf/3jqtIpq+Ov7tdYW1Hksg=
X-Received: by 2002:a05:620a:4801:b0:89e:67a9:fced with SMTP id af79cd13be357-8c6a6789e6bmr501565585a.66.1768581286239;
        Fri, 16 Jan 2026 08:34:46 -0800 (PST)
X-Received: by 2002:a05:620a:4801:b0:89e:67a9:fced with SMTP id af79cd13be357-8c6a6789e6bmr501559485a.66.1768581285613;
        Fri, 16 Jan 2026 08:34:45 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf33ef74sm897580e87.17.2026.01.16.08.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 08:34:44 -0800 (PST)
Date: Fri, 16 Jan 2026 18:34:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: milos: Add interconnects to camcc
Message-ID: <272itffci5xkelvykfijviarm6np22fvcofj4m4tud7l3fn7c5@n6p77vfid36u>
References: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
 <20260116-milos-camcc-icc-v1-5-400b7fcd156a@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116-milos-camcc-icc-v1-5-400b7fcd156a@fairphone.com>
X-Proofpoint-ORIG-GUID: l0SBIU5kTHHk3nYPsCGxvrY_1Is5Loij
X-Proofpoint-GUID: l0SBIU5kTHHk3nYPsCGxvrY_1Is5Loij
X-Authority-Analysis: v=2.4 cv=atu/yCZV c=1 sm=1 tr=0 ts=696a68a6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=jeBussX95TUAqHeP4CEA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDEyMCBTYWx0ZWRfXxzppPwB0G+P+
 w8FZAJO/nlwC0zHWbrcDCXH51b6oD0SRE4xfwchm/hDCe+Z79M/xtHW3YOmfyrSjV38vYOor1IK
 R1NZReQi37cBuoVz/nOEWAOUctvCCwhuHlYMLYacN1Cbo3aOuNJPE7jP1MC1lzj+vtcRjmKNbe/
 ArKVPGfN/LgS4WHW54UnQplZ0pXniBHy4UZInxMz44/41jZRjRRaJlm/oYXySm3Tlc7nQX6/d21
 2vBOmcT+leQu5lsBHondZoi7Slg0ih7Wnoj6hIETG8U9POuCi9TDTeFHZey9loGj3ctNMfXCYEL
 Qk3tykEZ0n8RI/d0MWC9nq1yCVdyX3SyWWvEtv3Pe8jwoIl3K+dH1s9a5WoJqBfax2033bpTEGe
 ot67RRji6rR65ZIJxANw4lJ/fq7yL24egiEvSCRolR2ZetzHUmYaKhkLnUCrgPijqHA7GHJteE+
 ACWgS+NKEQiAstrFuMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160120

On Fri, Jan 16, 2026 at 02:17:24PM +0100, Luca Weiss wrote:
> The CAMSS_TOP_GDSC inside camcc requires an interconnect path to be
> enabled, otherwise the GDSC will be stuck on 'off' and can't be enabled.
> 
> Add the interconnect path so that this requirement can be satisfied by
> the kernel.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
