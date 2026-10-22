Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661106;
	b=s327fxuaDUloNmGTsBuuH05P2o96uTrwiqjMHy/p/2etGQSY6QJRpzHsVhuSo8zw9x3O
	 NR2w6DrhddTSV4tK/UhUU+UCrSN8O267rnhoU2BtESmrCFURxv9I0zN/XVNEk4qTiL6AD
	 q86Kcip5f3Rz5TxUk1iKVsK0R+RNcVBSnxAEXUNNoo2NhbTjFyMtpCOEusuyPzsLKcpNk
	 7FDUR/ehXquG24pzKlIcVPJQYq3+8Ix+M28U0c4v0J5ogEGWr3O0a8sTgALYjllUyL6Y3
	 IEngpzXijvGG1KEPoZ6JdmpQqxmL6u+1vZIGPIfjxqzzlJWR6pcpIOjK34SiJCcGppA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661106;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZDyrDgRpyc93YfUqkragDvRCYl+joHD1buIS82tXjlM=;
	b=o2xeV8SDei8PaSY1lArhRGUicgwYJosdQQOF2fpdCCtPIg2HGHQfH9f35arludNHbNvv
	 wy93Ew/Sc1VuXBcBAdh8PgwIHiPp0TCwt88TpYJSxSv3zOpXX/nn5M/fUfVnh7icgbTia
	 l+zYkAD/+9AxlP1RpNTRMwc+kUW+3Ibv76Qv2I4dofdsEWSb25YqtLOFmWIEQo9pINO7v
	 Tq24m8GEwXapRidR/mDjgdHleoEig9DUTPxBMsy76bfGcRDoajEexsKETFKfsWdfkP0k4
	 jdmcg8hthq0bh3U/5Kjg+BeGvoT0VWTl/my4reJdldLoC85Fbfyu+dVSSNvbxldl2hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C8DjvWhK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KPI5JC5s;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D7A606A31D
	for <phone-devel@vger.kernel.org>; Thu, 22 Oct 2026 09:25:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5D7A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C8DjvWhK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KPI5JC5s
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M708v43025122
	for <phone-devel@vger.kernel.org>; Thu, 22 Oct 2026 09:25:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZDyrDgRpyc93YfUqkragDvRCYl+joHD1buIS82tXjlM=; b=C8DjvWhKPSwpRQ4d
	rw41rBEkaPMe6iGTZYzzOuDe6vhj3LT7InylFKVRaI69dK7LIRE7pHBSfA4cQgfm
	kIdyxUmOw2xSwKCP9qw4tGCE8zgDUhpZXlB9xaHe2CbUPL2Xkocv2gHMlth57qjm
	h7MitYMu9ftEQQbwnJHOLSbsXMnpcvDMmzxmdK4Wd8yEHjSy9BbNe0cja0QrQxW0
	Aj3FhUikXyA/L6VoZH1kJhnloIpcFJn+b2AaaKt308Wy/9C76dhE+KTn7cF/teS+
	2TWRa8v8T0bMACCYkm0ww6Hr1xr84m4EY1x33fgiIbfPYZ/WXpHrhjNyTZxBHLVL
	rgGbew==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93asmhp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 22 Oct 2026 09:25:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc50fb0d2so33618685a.0
        for <phone-devel@vger.kernel.org>; Thu, 22 Oct 2026 02:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792661104; x=1793265904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZDyrDgRpyc93YfUqkragDvRCYl+joHD1buIS82tXjlM=;
        b=KPI5JC5seiCV9gjNNzY2sODQ1+/DEOQFOxHxPnXwT0xdcTd+HzA7cXafvJCZ8yPubw
         vKo2tkPqAii5f6BcC6o6p8aunSVg9ERTLSiJLPuzR6Q+oMx4Gf26GXzkP++JX1v8v8rm
         Grv+xclVIC9WpwPHebMG93ACDPlmTeYlIgAmRmkz5z6tlpvqytkdZ9AY3VVnBT5CVXJ3
         SS7BxJvzZCf5tVSUWzJHYYQtQ83PI1jBEle4QLWZWa9CSAGKgUFPF4QTGN1T5xzYiziF
         6EzNqVEnzD7/47TlRH2jhG6d+/XXuRIhDpgc+TrBKah8NsgWAK92tZW3HRbD2ZYu9s2l
         93tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661104; x=1793265904;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZDyrDgRpyc93YfUqkragDvRCYl+joHD1buIS82tXjlM=;
        b=RgUfub9yyGZLMJf1UR03t9VjSRj1tAiQcnq9B73RhZYv3YXqDItHya8moUu/Q3kfwn
         Ee5Y8dasRTiccOQTjMF05FuuL1iqWoHgEgEA4mCT/gGbJU6wye3ALZdSeW1JcT/LiAU0
         epouC/R4dIEIIe+dO4wMPZ7KT9ZeFQtjslC9Y+JIAHpTtGjX2Bfx/DnrjyF8TgXMgBzF
         y1Kl8ogDKn+MsqdqsR2SjdX+p4t98qid1XiLSFmMtSuRgo2WtodLyzYUsEpC9zJGVsBL
         eMgCMEBgnOQRTTTJNO03alcfV0y1XtNeFB++ZS8QpCdaArO5JNqJXrkkm8Qwz9MVng7/
         Ting==
X-Forwarded-Encrypted: i=1; AKwUvBw2m0Aw+AA7rVx/oDvW8tDLxwqNtq0ZcitkZjhiPXLTaiLQQGtzewoXg5waDv1wZZumPVT0hp5CTo5yxg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLksrurq7DhVmFYzcEUUo3IJvWjzwNeOIYkpcpkID3uJvE8nRHH
	OTl4EG+9LKjJ4lZKaQHHru2osIqWkYVU28UtCNlBLXvSG3VmSEHf1vcpoVAysSMPJlgFzZBz23e
	VFmNafhcSfFG7y/zczNi5oLUYahoMa2rYBUH5usS/+9HrYFOob0+waTsJIyOTDfJx/Q==
X-Gm-Gg: AYBFou3hoRFPbMT3fpqEV9xt8j+oyAOTYMwjwpaSvGqyNiD4i1QX8fA/SCW0GwS5z4W
	Zm0B+i8KifnX9kz/jAxHZke09qpwW8llTZeQ1npu3U9zTY5zgUoWuDc3JTeSS2ljdame+8wB2Pa
	cis0ykJVSMRV+gL0SlrjPczmx9zhjQ1/ofoVdf5m6r2LeAcs1kbeWqeiSRiBEhP6uU7xcl7860M
	vgfmsrNLBmec/IRnbCz9VPTVthQyH9FSHOmOD8wTwJns81nvae4tl0aD8JW/9p7xJb9cG/HZXG+
	T+pe563kZ903Iyj/+5vVowmqWbewF4NZ71LYfAGr5usyBDHtoGUjHvEgJ3x/FreRflRt+b1lhc+
	+D2BnompbxqPDEXyatcZgaw==
X-Received: by 2002:a05:620a:6087:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93f57d6eb34mr986884185a.0.1792661104165;
        Thu, 22 Oct 2026 02:25:04 -0700 (PDT)
X-Received: by 2002:a05:620a:6087:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93f57d6eb34mr986881885a.0.1792661103736;
        Thu, 22 Oct 2026 02:25:03 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b403130703sm1601567a12.24.2026.10.22.02.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:25:03 -0700 (PDT)
Message-ID: <91fd4f3c-ae73-4a51-8349-6c75b99a588f@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:24:56 +0200
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
Subject: Re: [PATCH v4 2/3] arm64: dts: qcom: Add sm8250-oneplus-common.dtsi
To: Frieder Hannenheim <git@fhannenheim.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>,
        =?UTF-8?Q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261019-kebab_dts-v4-0-bb6db87ff15f@fhannenheim.net>
 <20261019-kebab_dts-v4-2-bb6db87ff15f@fhannenheim.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-kebab_dts-v4-2-bb6db87ff15f@fhannenheim.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfX7ZFyEMW8kwV/
 zudeaL/DLf+qlMfUkUfGpPkfk8ICOceVmr+O50JJ7wvolLdaRu7b6Eu6jA+iguhwrvfy+XRjpnf
 hSAMGArUf8OTPjbsQoBwsRioBJS/8yao2kfAyHbHK9tcnv2bUel5arakEO8ZKKqmZ838Zg49Wd0
 F2UiAob+cJUtNYB3x6N3gVASOjRlEkBNY3MflRxIJtROswSnerIvp9sPhrQL8n+nyilpB3Spkih
 tAPlCR97JZQC6IXrVkAnRMBnv076+hcNfNtFgaL4hRfjkQvgjxesdw62TYDJagCdPAmuRARRlwN
 RRjpEuUKoLK+nZ/pBMnvW8pSjxsFF3JnWyWjxoKmxsMfIqgGJTIoHZdIqjsmkq7nF03vY7mVFo5
 hRtNgJid7/yLJVk3MfXYiooA6CWvVuUjvNChbSeQbB2e5sOpAcXinxmXXcdeEAmjaLvUCodGL9q
 PyJUN3DAMuasuvj5XJA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfXwdRklwlU9+gj
 0a7AYx7O7u3HTi3qYOBgVGNP5j1SystpBvCcwllSxM2wu30RCsuTImribuWtdWgB+NPnWOeqndG
 +6kYX4mK32MM1NMp/yDkDfKy9M+q1MM=
X-Authority-Analysis: v=2.4 cv=QPn91QLL c=1 sm=1 tr=0 ts=6ad9d670 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=WE8o4AYwAAAA:8 a=EUspDBNiAAAA:8 a=RDJzJV41rLCqGB0F5dMA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=6aV5INxNnvWGCTbEtcBN:22
X-Proofpoint-GUID: 0FzIf1ACFbC_mbw73u6rAiIxqjxJtr4M
X-Proofpoint-ORIG-GUID: 0FzIf1ACFbC_mbw73u6rAiIxqjxJtr4M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220037

On 10/19/26 12:18 PM, Frieder Hannenheim wrote:
> This file contains common properties shared by all OnePlus devices using
> the Qualcomm sm8250 chipset.
> 
> Co-developed-by: Robert Oscilowski <drgitx@gmail.com>
> Signed-off-by: Robert Oscilowski <drgitx@gmail.com>
> Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
