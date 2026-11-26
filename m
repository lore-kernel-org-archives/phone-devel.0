Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681916;
	b=spiWFL3bt6rm5NjQfVCSqQF28J4cZyncgVwFPsBKb9cfAFjDTnCN3h3s8RwCoCy0wWwa
	 MzTxpH2N+aif/NgWwbPYemJSsn7U7R5kkp1NmYYbqSSJpAftEWumGSWAdAlzJvD2frVvQ
	 dup7Zuay/mSZN//B5PPUZLzJsU2zYFfJ4oETPQZYlA1v2vCOzG2yfGQjNCB/AfPIfbXa1
	 q0w+IJpuCLOFXvVfhw1VFeFUEgiOtfzajdhsHUy5e2AjGztD/t1av1Nae7B3Jj0szPhnN
	 /ukYve6XaC2Qpm+ATb0khA6Gif8cvtqpRRqKfALK7S9Rr4K509dai68Z8xRSB/IDW/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681916;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bsFyyn4glzVRtAEYcoWdywoe9cNyQJ0bI+XLL83v7f4=;
	b=NhzrmJVLuAf4rnOFudUzSdqa3N7qowGoNp48cSLy1HtasDuqXaz5k7NiqwIv8BJhNeze
	 9ncQyf/qht7n801DFfBBYx7JYAOYFbYdWVWH+EeSDssw2aNwdPxDyyw5RPz3iWb4op2hP
	 Cjo8Rcdez8ZtlqTsGjdCJlk/UyXHbPI1+8wdpgGnn4tAjZgiPt5XMMpYfD/Im7lKe/+cI
	 C5ml367AAgK47whLaCaepx8JNqpac4z4hebZEKR91XVhry34LsLvjsqnQDjlwRUzA3zqx
	 fdN+8UqcMuNEC4gA85KBWau/kBNzKGtzkeGTpZOHtjsvP5YpJI6InpikRwsuq4oIIXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VHNHPIPJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Cb/6fMKG";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53D8606A31E
	for <phone-devel@vger.kernel.org>; Thu, 26 Nov 2026 08:31:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D53D8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VHNHPIPJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cb/6fMKG
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7BGSQ3315245
	for <phone-devel@vger.kernel.org>; Thu, 26 Nov 2026 08:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bsFyyn4glzVRtAEYcoWdywoe9cNyQJ0bI+XLL83v7f4=; b=VHNHPIPJMFTm2FRU
	Ec47rd255jdGakFPiT7uMNt5jTPVQ1FicYqYVdwYenErQFi/LL0zxANpIH0/9R2v
	CaxDDGSgDdEcY4K7pleWjKTGOdAK1Mgtb9oWb9GOnAt87/eEaslWMZupabxh2sff
	xUNxi0+qDzGW8vT5hvGc5/mnnJBo0P1zdev6DavGVL6ePh1vfaa9UMWb+YbMWPLF
	N/D03OTZ47kaP4nP+BaIawczseyDP8EAkW6AUV4edvJDPvf9WvUFnn0BEYBP0oHk
	eOYrTAnda0Uudxk4Ns8q0cZI5VUeC7BX+R1th+ME8biWt1JXuc403hEXPY5wTB3i
	Mv6H0A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnvn11-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 26 Nov 2026 08:31:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-943fffbc5dbso48255285a.0
        for <phone-devel@vger.kernel.org>; Thu, 26 Nov 2026 00:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795681914; x=1796286714; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bsFyyn4glzVRtAEYcoWdywoe9cNyQJ0bI+XLL83v7f4=;
        b=Cb/6fMKGaXX7DeYORLnDNyi3KQ7pSbCueISIgAOKLZ0XvQwJNqf7BCJ+IyQGOVk+j3
         Yrq92XewJDVlfY8pqCfDNNWgfwpeuugtyd282Yjt89bYHzCmTeRYq7fPgFt7pYJiVjr+
         TBwYweLjnrwglRFQlStNM5uDZh2k8tI7ZdXqjDDQ1X7FPBVPMfDV7OpXrdD8YgDrcXW0
         EdG5yLY7LOxMnuqmxODqhwU30glmLUDuZOF7sUZt6ZkzUJD8ksDFXR0FthrLBfLkectR
         5mE/89HFzREN74TEcb6sYjFQAkvC7f+dVZxQ9JU9VL7WRX/zFi/2kzSl9DjNURU9qPdN
         1EAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795681914; x=1796286714;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bsFyyn4glzVRtAEYcoWdywoe9cNyQJ0bI+XLL83v7f4=;
        b=Hpm2Cbz3wq6d3dx/WRqGhZ/iuZ+5lj36HA+HnXCd5yvdtrp/gSuXuDV86sOKNajBW5
         tI8H/rP1wthnUjXsoWSX/TRwFrhF8UFcHXW9EI7mStrQW1V5oITnwJg728M3NTz+XJhY
         DxdXi/KfU8h+PyKAmoqygiCCwdrjYJhXqZHeYLDHTDlAlB83tkwJjw/Q5HKF6qmu0UdD
         NnfESfJ/ESzBHntCRN6z3ZiMDOIRPljSSdsNWNKjZ1lyrEMqXPwfCXL7/JOAr4DezW+W
         eOhy+KbGsgNbSeasogBOAwSLZ8mh5XqNRQLrpWWvPwF6f5ryq6fu9JT94vMfrA2UMiAx
         obnw==
X-Forwarded-Encrypted: i=1; AL+hErE07IH44H98dzTxDNta1uytWBNBSrq6lupK/qoDHm2lFUv8Sp/xuNsS594IXNcvQK/+WU7UZThgqlh+HA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/tH8r+AyC8TB3OdY3gxPRy7Pau0lYlntgydj41RKx0+6fXZ9nl
	GDp0YBCyncvy3QDVM3asnadSKqKOvJe/xbEtmD3zZvCTvN9znaqJmuyt5PDv7pI0eyu6Ot+25oZ
	Axg/8W0PwDX2Qp12rR2vqQw/lj1FSsZtnjN5IBhYmj51gxkRQGYmr+VqEaljE1TLrSg==
X-Gm-Gg: AZFdTZeP1cGHQ4laLBy/bNqj8F02v2/mi/8c6L3hC6O6wEwasxgUQ3IFx7oByjNZGPg
	KHBExsMmKd6Vczu78f4t4UB8ENwtS80okAwoAzptS+Ur2SUl6JCcM49rQexcXzBKUhDmIgXN4sp
	kpotUZ5xou8klQ4gP3ZNtEta/Cpnp46xdU99RQn4zkA6hRuj1cFamhG98sfsVr7Uud4hdddwQY2
	tjzZA2+4Qz1R1sttth6U0Q2t6oXTd2P1Ck7JaYL0a7ogBQpqqDZbAEySyxLqbFkvv05WJi1K7fS
	HXizgKAuk9re5/gCBdqQX7/DGMKTHUglhYt3Vp32C2SaudyrTZt1Sw288ZtxeopZ0ZGNsCK8cRH
	d3uGn/pIhwyD1JTZWeOf2kcUN0pHjpTNUWmVugxtA+UPDc0+YAY8GYgoeOuHuhH6xadNfrEo=
X-Received: by 2002:a05:622a:e2cc:10b0:535:f9db:3b86 with SMTP id d75a77b69052e-55d769f824dmr343745961cf.3.1795681914137;
        Thu, 26 Nov 2026 00:31:54 -0800 (PST)
X-Received: by 2002:a05:622a:e2cc:10b0:535:f9db:3b86 with SMTP id d75a77b69052e-55d769f824dmr343745661cf.3.1795681913644;
        Thu, 26 Nov 2026 00:31:53 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e8adbsm9286795a12.17.2026.11.26.00.31.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 00:31:52 -0800 (PST)
Message-ID: <c1ec2f35-955f-4131-85f4-bae78d016c98@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 09:31:47 +0100
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/9] drm/panel: s6e3ha8: Correct the polarity logic
 within
To: david@ixit.cz, Dzmitry Sankouski <dsankouski@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Marco Mattiolo <marco.mattiolo@hotmail.it>,
        Petr Vorel <petr.vorel@gmail.com>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
References: <20261125-crosshatch-panel-v4-0-120adc58e737@ixit.cz>
 <20261125-crosshatch-panel-v4-5-120adc58e737@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261125-crosshatch-panel-v4-5-120adc58e737@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzMiBTYWx0ZWRfX/N8lkV3j6BMZ
 bwUtOHIJZLBK51o9wWKFZUZfH1MUEH4S/RcGv7KEQMFLsdrHgA01B2dMtiXVsEYaM/nSFoE8RIA
 ex8uNteru8pujYcC8GC2VoSet2buwKXPkORx+/fS9N8PHav19wubkNdnihr763Zh271HMPTXTyt
 Y7ArStJRGCuMfZBKzExMF8sZPA2qjdYpyp+/Cq/yjlnx3GFFuqRC4hk7V9an3W0mukfqfbwJfTa
 Z9HIa/6zVL8bdjDyvspI2oc3rXFWctC+zmFEpNuxMoBodbNs0n9OqnxY1t6UDKh9dkjE4Xk8C7u
 rRYmlRKKQxOdzDgQ7TXI1MIpZ2eA2Ex28K1RL3uOjbJjweBZ+KxHPr8pvaMhkIOy9JhXso6hBc5
 doZHiNNv14ShK4MeYu2JaPP2UwTgNiEGnsvVVT6kwVCh/Rz66YZ/9r8G0Xtx6zhqTaROm1g9Oxa
 sls7zFROXRU130IDQSg==
X-Proofpoint-ORIG-GUID: nt8QublASn9wmgk1vrtPgWesRXRiVgJW
X-Proofpoint-GUID: nt8QublASn9wmgk1vrtPgWesRXRiVgJW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzMiBTYWx0ZWRfX5FrH7UPe5Mgr
 bxUJAyrBxpDJ8mxSYKu+FZiRj0Uv4PmNR4tc8GDr1AEJjZxD/4w2xG9itjiF5hNKquoSxHdUdFD
 ay7M2y6yfC0tlMRH3Pp203olojDlz8A=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b07ee7a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7BbI1mFHGmmar5m0u5AA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260032

On 11/25/26 7:12 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The reset was introduced with wrong polarity. Correct for the future
> compatibles and keep current with reverted logic.
> 
> Old DTs keep GPIO_ACTIVE_HIGH and are fixed up via
> gpiod_toggle_active_low() on the deprecated compatible.

738455858a2d ("ASoC: codecs: wsa881x: Use proper shutdown GPIO polarity")

made it work with one compatible

Konrad
