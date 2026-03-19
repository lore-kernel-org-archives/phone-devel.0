Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EB53C3454
	for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 10:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773917016; cv=none; b=Ar9L94DkYJ36/00CBg75nxauzagcFIfbR0HXGXGBeZU42ki8fkMYGGVUGNJ/86kvMCgT1D5iwHL1j5iqnPz1SILj5tq516OTZQA99N6mYaaHlCqDBLYrRWiOZDl7XSpI0pUhsN+kSQKpmGU8x2e/rS5URAS8VKjXqxtqZKGr7dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773917016; c=relaxed/simple;
	bh=uPQWWnIyq/Ng6Bu/jOM8RgjZYIOT7qa3LRT/IAGX4AQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MaYoeqtjKrnogLrpopOpleLz8hhhEg/9gt4knb41Ntr4jrZRMN+Dq2Z6NjP6Ta4+dRYgGi7OaFmDTIEm8tYDPqNxCHU3U2VGscoVgWooHm5l4TqfnGr/1jqRLS8VfOMpjyjnWsMfw/np3ftH+N+3HYD+qJJmTikYuz5oIxUrSKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lI4y85Jy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MDXEMYR+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lI4y85Jy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MDXEMYR+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J73wZA3927148
	for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 10:43:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AEGfw0KJee8DCRKbyA9HzJFq4eyMz9hO7wvF5okQWSk=; b=lI4y85JyUyJcVU55
	4BJNPKQTCfuGgKxwImua1ksP0xkG0XenqVPSarFiARVnGFzEk5VJWQIgpK0TwRfP
	wPLdIDrB2KAFAoktmB0/cn2zd9NplCmgdq2fFjEXR+X4CRVdH3NeOPSMo3MNllpz
	oVH5KWxPILZ91dulm/0iEc65DwtnCOH/4D2uIdjBZpxjp1rQvTOvkUElK1yEzwOK
	M4T/YO2tvUNHHdiTxaxIFt3OAyxjK2S1LweIIzg7VsSCtRJ2CEgVv2ZZHM7sENnn
	kiXwZHi2L+/FmwIGYc6e5+fSHuf8bKL5YWEUyvSNSlCMwksJDOVmHkUlzDL86+8p
	0oltyA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyut1c2ef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 10:43:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd93c91075so69716085a.1
        for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 03:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773917005; x=1774521805; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AEGfw0KJee8DCRKbyA9HzJFq4eyMz9hO7wvF5okQWSk=;
        b=MDXEMYR+gYM4fi0rZTcw5nBS1UV0PcdEiaWr0LP+wLdmpOXVAszkwvF+94LO/euzKe
         B0l4CO3MgfP7eYt3x6KBmjCN65ki5YxQb1TOn/kgL8BjOeEa+k9rd9QYqGWBGaSW3ZcU
         8kC1j3VsXUdjd8V2CJ6uGrR/hwOU7FLXa3cq8DQzojI0uioHeWYJKVC7tl8OBnMwL/er
         T3+oSgom3KBOFOPf8BMnm1aS0SoO94Mk2E4MDlr1Hxjkpra3aCYgLRPuHfaVC9INm0gO
         NoLn7NhDToYi2LW1/wamEyOCMK5KTc1YKu+rhsmMRBeqacKpi0CQrqVjDSAN+brWSAtB
         X30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773917005; x=1774521805;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AEGfw0KJee8DCRKbyA9HzJFq4eyMz9hO7wvF5okQWSk=;
        b=nCkky2/LiaEJHp5X/c59NuqIHqoiUDYqvM/KDdIL7/nM97Bu/ZQCI6RakqLUZbkf4I
         tzc6AWdBbgXL3yu6ixcD6FMJLM503iEulAfdePG9q/Zy3qZtYgjiScDjI/bEOe36/6ai
         Wtge+q/UDbrkE3h9hUqOkdcFWInKUFR7RYDrvMKKKD/3JxELaN8IaE744sMxdmo+1Jip
         Be2kqV11Aaoq6iRFE9z65YumowJX5gdBn+0gDzO2/1xESVdWU9slDU2v7KEkDoKKsyG9
         FgLmzoGLK/T9LkWDBqVLGzOnoZ5TpzBMnyDKCusYYJ5FHabvVFI0HFwy3QTrBhrEuhNT
         Vmww==
X-Forwarded-Encrypted: i=1; AJvYcCVkQTy46g+qY4lZGDdF2I3JvKEpj9cJZWMOZPc9DOoX9PL8E2g9K2ce9hgCqULE0+TqYls3rd+jaT+mjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmIFNhHgjEpxw8wVSu0e9WKk4waWg/WJRWUX5uYx6f1QDarBdf
	+JOw5fsOftXfW2ZQpMuDrKkyuxWbCSYc5xdaIbXslY0m5M1mkdQYkf65Fe0r6kfR5WrH2Xd4O3X
	TjP14pjShvpiSdXyqm8C8nT4mNrOLrruS1NA0DTop5ryXoxnc7XXD37I+fcHtnBJgaQ==
X-Gm-Gg: ATEYQzwKzXc3dGLrcF/1H/Kdaz7jH3tKomKDbXdQWRWhOLuKJEp6iXgc+GiLYTs1PIL
	i6UbDELwFRw/9G4nP6x6g2yl6pzy5QRfgPhnVJPfZBB8F8vwgGDf2OvwCYAec4ENyZ5sq76L83G
	hRueGFFIo2cjRC21uswQhA2AuMqmaWkmBXc2A+mwOugUnayPlhdoxS21h5pjcGXPY9Dqe4JDGzE
	VW4DJyLYcHrIHwgW7JtBKQjvKSb0uHyaxcdup/pD3IKAKmjS2a4JRlrjyOIaaMLXVFpdCW2v+rE
	yW3jGVOW+5lFpsHoxEs/G/KRM8hJtDifeubtFU28z5ZaQvvZeU/4S9PTIyXXWBsNKwv5RBmHvuF
	0xGfPN02fGVlm7V62hz/MOD1k3GD9Q0Wsg4b6M3eRLxE75j38Mo0iIzxQILTG+jUPuRRLgyq2NB
	pru0s=
X-Received: by 2002:a05:620a:4155:b0:8b2:fe27:d2ff with SMTP id af79cd13be357-8cfad325084mr689431985a.8.1773917005065;
        Thu, 19 Mar 2026 03:43:25 -0700 (PDT)
X-Received: by 2002:a05:620a:4155:b0:8b2:fe27:d2ff with SMTP id af79cd13be357-8cfad325084mr689428385a.8.1773917004602;
        Thu, 19 Mar 2026 03:43:24 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667aecbcae2sm4007186a12.1.2026.03.19.03.43.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 03:43:23 -0700 (PDT)
Message-ID: <36659080-1ddc-467d-9326-87c8d685b00e@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 11:43:20 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 Hall sensor
To: cristian_ci@protonmail.com, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20260318-rimob-new-features-v2-0-c1bf8917449e@protonmail.com>
 <20260318-rimob-new-features-v2-6-c1bf8917449e@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260318-rimob-new-features-v2-6-c1bf8917449e@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: awzlC28DtfMD1GHjwdPp-FlRQhLBfC67
X-Authority-Analysis: v=2.4 cv=ModfKmae c=1 sm=1 tr=0 ts=69bbd356 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8 a=1r6qRtClYgtMJJxfrUIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: awzlC28DtfMD1GHjwdPp-FlRQhLBfC67
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA4NSBTYWx0ZWRfX6n4lXVwouKeO
 dG0g1G4FLjXu0lkFRDnqWBRqKfC9NyVnL94mQyo8/rH4wZUYwAgBsIj2SWQXb1iJS7U1f8eyruJ
 RjfapKskyva7b8RTSlffkX8P3q1tpguEyvOJFrMeymX+NRiUUyeVPX/uevxiKaRlWS0qfgKh84Z
 w2Q1mnnUd3n13D0VfmImUs9vsmJblzfUVLQbz0fwuw+vVrKsMoksqQ9QomPv79nph+57PWGSUrX
 kARZH7JG9vm89NLghXZnqA8h0PzTIc5PRx4xdMbah/lAGn4l6KBHMFZKjiJ5k/lhxo/cX/YC7IR
 OmpBmWdQN1aIgJnEUu7JD+riKLKrB55O8H4CtXEpb2HLYV/H4MHfgI1arwfUx2OeEiDQyWD/fSP
 2gaJ4ubPkJve/1ZZ6dD15rIsGvU2qmJkEtmXB9gexgO377s+3jMSCDd+jPjkoB9DDqUZoqQu4N9
 1CqrH5xwHv5wvepRvhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190085

On 3/18/26 11:28 PM, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> Enable the Hall effect sensor (flip cover) for Billion Capture+.
> The GPIO is mapped to SW_LID events as in other qcom devices.
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

