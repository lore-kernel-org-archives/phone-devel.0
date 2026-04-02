Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBC53D8128
	for <phone-devel@vger.kernel.org>; Thu,  2 Apr 2026 09:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775123168; cv=none; b=JgQQ+zwKPnPIZdW20QWU4RnJEX2if+fUp97ECLYimR+ZrzFYrsAcIfxNlcolg7Ip/1EnOs1uFvUutzo4JoBM39pCqHzaDrj2NQlO8QL8r7V8J9sUITB+aiZ6PMBLAYVcYKf/0fdti28sYUpYLRSiOK5qu74FJxGjQi898K+nfRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775123168; c=relaxed/simple;
	bh=Mfd+Qq9kOh/v1GVdwWuBvllZlQjBdLtcEia0O51e/kw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a4dr+fPnRNFS42Y3cmzq19w5K+ZTSOnG94bU5ovjdSCQ/zi3WCUNpPl6sxgRloUewkcdYranbJHfWOgox3cTU0hx7OvH4n2k3+v3CGCknNvLyx3KjVbvvoGL50N/EY5KZh5tOeBqwtT+g9rdjhpSaZeLAzIcxzfHDKE6Z4/PP5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n6e3DlTm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iU8lJybO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n6e3DlTm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iU8lJybO"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6324Ql1X1551329
	for <phone-devel@vger.kernel.org>; Thu, 2 Apr 2026 09:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PW394LL7WiyVppb3yqX6xaB+fIkBISkkCqkC763mnp4=; b=n6e3DlTmJD8K2YSn
	F4bRWatSdrlpbofRzL0aXwBLHoFsrVaElC0yRpUy9T9ZOoySfb/y5bf7l6syNePc
	xq057NatrOTa1d9fcSyshrWVfphwY+iEIF19j1Xtx8TpKB1cUdnvuzRklCZV7+pO
	N+gCCQPXkHx8qQZJnvtBipGGIqUZxI8JHyMBgdmx9ns3M1lfVnyKDpptsRcrzmIq
	MmryVSJQyxSfCp98oAnnsm80vjJhm7WiNUiDhJnQjP6J0yZzHqQoyOWaKSwPCEyH
	PeN6W/1WL24t7xxx8OcEY4tvglaw4Lq2MP00c5owTn2pygLUI0IPv+WoGPyrTBEI
	b9KnLg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9hees9rw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 02 Apr 2026 09:45:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b32feb719so1563911cf.2
        for <phone-devel@vger.kernel.org>; Thu, 02 Apr 2026 02:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775123153; x=1775727953; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PW394LL7WiyVppb3yqX6xaB+fIkBISkkCqkC763mnp4=;
        b=iU8lJybOi0lryrY0T2rH5nu+RBGP/aB/SIk6RjwaowKmHnjPzuP6c38mfL2rIcyF4Y
         AwtEBRyM06FQg9qUML7V3+bCLIDLmz4Jpq1ipfAZkwfIIW7Lp4lCapEeJthyzg50mwK+
         dTuMs8yyVq40yMrFMVNKCL12W/G6k44tZe9HMwrdUrTDNMdHi0ihs+hmbcsxmbNBk1bM
         oEu4jFxwnz/bLVt+J+vJ+LhCHPWatz0lmH/KlT9FKirJPHu+klER8NVdbfGZeBrfjBH/
         lVdT5UkbL80AhcQs47luHi5f/P8S2QOrhTUadJtiu5k3DjmPnn5Nv4GZopEFzSLPoBz6
         yPSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775123153; x=1775727953;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PW394LL7WiyVppb3yqX6xaB+fIkBISkkCqkC763mnp4=;
        b=Y0xNzSvsbpJZ6xGcJV3ylCwssizlWkat2Mzf26+hqk4Tt5QSjrGbLBMLpMSSfCFTuH
         Fy7FJpprbUnOLmxW4Pz1B3tTwjb8rvTfvQBHnnitF/oW+9iAjN+bleGVoZ9rsQ6HcK5W
         UlcL1j5YHXkliLp6WxR7uYHfDanJfB6LJTBjPOjLCa/hSUhEVsLQmBEZ9ue+hwoCsAjL
         dzRcIcBTCQzRnurKCpSwsGtWX704hKKFAJgNfbwv6R0LB8U89qXygiChdHCER90wdesX
         1VRWipZALfrPVc+lmpm0TwLHpDUgNwWpXxRzzbUo/FkPfO0+TfTQd0nfr9Map5+g35Wc
         4ySg==
X-Forwarded-Encrypted: i=1; AJvYcCUtciP+aQC2TS9C+sCTX3Ma0717hzV2xErhSdGgN9KDzBHY/PvFMPw7YkPEHR8A03Jd3Nhj5gLVk9qnZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YztRHn4ilbzHggi3sbf7OuiudiGx+WlBLVXUWqi/RSbAyRXKm9e
	doCrqXc7e48aMwOBa/1jzeFQZT4rUjwAIjUD1NvEdCa30jy6kSpm3f5E7ZmVop4s+qq8L9hIzuO
	hZu2f0flda0TZJX1VQYDF3UkrhmN9nmG6eYvxhO6V8SHWzFqIsqe6adocjapNcliWbQ==
X-Gm-Gg: ATEYQzwhD+YSXgy7i6N5obytM1oP8J6UqLRHoHV3Xe3dotKLW9AAKuQrzDIjpiPJakt
	lt7DeSwtmgSgnSDvSbWYf6tBgvsS8gOr2FngvCnO+dv7a+7tyDM4xbvDZ6FFJEbILDDi9jir8AK
	BAvrIfFtFgUGZWxfL8PeT5qjqgAMKPtyRvGy74PrJShhTzEsUTaz9pv1CsC3oZwxi8OBB+gxsWG
	RGL/zAoeYqjiIyRrEvj7RSw2Y8GCjRfw+fcFupsjCEBCWGiGAqnT4BTLOcfldZdBKguo23qBar3
	qinFIA7p7UrnXZ+MK2cB7J6merBe12hjuSoiGy+6/Jac1yM4CPTnT8xxuwfXyczXKY7TWM6aO3n
	WUq6qUanr8VgAcFTZpMeTLxnVUyzYRoI5AnZRTwLJ0HTwDdabLFUV8F+DAR2N4fflS5+zt+66Zi
	FzKI8=
X-Received: by 2002:a05:622a:1985:b0:50b:2275:8c1f with SMTP id d75a77b69052e-50d3ba26cbdmr67168481cf.0.1775123153613;
        Thu, 02 Apr 2026 02:45:53 -0700 (PDT)
X-Received: by 2002:a05:622a:1985:b0:50b:2275:8c1f with SMTP id d75a77b69052e-50d3ba26cbdmr67168231cf.0.1775123153118;
        Thu, 02 Apr 2026 02:45:53 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c9721b6sm73265366b.10.2026.04.02.02.45.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 02:45:52 -0700 (PDT)
Message-ID: <d7d99d3d-bbf2-4822-ae5b-b18976953543@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 11:45:49 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] arm64: dts: qcom: sdm845-xiaomi-beryllium:
 Introduce framebuffer
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Sam Day <me@samcday.com>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Petr Hodina <petr.hodina@protonmail.com>
References: <20260401-beryllium-fb-v3-0-ec7d443402ab@ixit.cz>
 <20260401-beryllium-fb-v3-1-ec7d443402ab@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260401-beryllium-fb-v3-1-ec7d443402ab@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: y7-JZkOCh3IiRfMoA49v7LLFySrNWiMK
X-Authority-Analysis: v=2.4 cv=VY36/Vp9 c=1 sm=1 tr=0 ts=69ce3ad2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8 a=6HfXokFIjMK-uoYlQTEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: y7-JZkOCh3IiRfMoA49v7LLFySrNWiMK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA4NyBTYWx0ZWRfX5GT6stjIPt9I
 HwnwCrIEoHBuq9v4JTKv9B71bbrw8ze1KMDy+DmXAyiH1vsZ/nFcSmNbB9lLNyHZZd36Zuziq4D
 Kw2ZCld2eYlPcQqc22JWgk+z8qYeQzkHHWc7WaHVbwffCeFc+vCC/qLReuRePqEYgEPRihMrhi5
 hstDCBvwc2lcqR2k4rlsqQpJtbOGdtKmRuL5krLB0fLaNj+dfn9GR8JHHm9XKmeHLL8YCbkRNNd
 jY/R/Yb1beq73BwOB/OGlKz3A5Brg4fUZS6kJMJhKUBEDNIsKE317TX9UUkU9rrkinVGp7ocYr3
 PKAbzugUIYio3HwoA0K9AiAkvkUounAaaLiat2DDiDx1NBGfP3JEe8D/CWbnLHZ0nmZwaIOn3Hv
 v2F0Mj7whNEOKk6Tn6XbKIL8cIvK3iE+ZVO1ssuLx8+S33Ao5Tv0Raq8zc6o1+kGrooqW+LgC+i
 Ro0hinlUd/N2sLN+vjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020087

On 4/1/26 10:40 PM, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Add framebuffer for early console and u-boot support.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
