Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61BF2222BA
	for <phone-devel@vger.kernel.org>; Wed, 26 Feb 2025 17:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740591956; cv=none; b=c1vczX9YIGA59Rv0yj9IuRlImbZyAzNe1k+NgNzf02XrP0/MQXNZ2r7oeXUQGNFcg82NKe5ssQ3OpS8ifM8EyzbPVddB7iq0/GjTX2vGncjvWaVRNKsUjph805YLTJcpw5z2uT8yN/haHcovqusd9frtPbmWxsdf2vPoeW13Zqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740591956; c=relaxed/simple;
	bh=h3UCkmKo1484qRmPGgUdh+KMuRZG6JXSyGfmIPrt1D0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=erLhEdVrWqb4PON+4NCMQKYAfaXx/Lvng5kMPGecvZ8SC8GzZXhUT7HSwd2v2deUs1DYytvtiZWSTei0l5lUJemMo8UrvGIGA8iuQ6j+OYFK9nRktUcdUMY6slZjlqgj6WZr4bv6a9fNH4Pqlw4kBSbLfr9ZUEfLcj0CBhsJMRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jeHlYBpP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jeHlYBpP"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QAAN9O011851
	for <phone-devel@vger.kernel.org>; Wed, 26 Feb 2025 17:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	spHUr3AXu2f0Q/mYO04AU9/9MDHJOsZPrNXfPRcj58M=; b=jeHlYBpPslALlr35
	LN/uaObw2ZoG/LQHgaWyQI/uXMZ6mMDZ6U16XzI0anqA+3eGr5/MB5AnU+JwwhIU
	Juz4RQ8HBU0S9o7MDUji9ehBZaB1hB/rgaF72YoMdcI9+8rIsxe9cpHiG0PJxOt+
	aJK33zfI7qTp/eEXJdWNORn8/3OQNoGbGVgE1VoeviK3FHY7G+4+8E6CaEhNZI0Q
	sI/wYzry3EyfvRC8eDjJ5fC4eMAKBLDrpTb8ThZDDrBm+bGQ3zM0Y58MZsrJB8Om
	+43G0FqKBS0axFBOlW4LlomnjOVdCD3QdK5nltFr+7iQqbp2MzCPcMQTQEwD4uh+
	/iCfQA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prmjtkk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 26 Feb 2025 17:45:52 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e249d117b7so153456d6.2
        for <phone-devel@vger.kernel.org>; Wed, 26 Feb 2025 09:45:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740591951; x=1741196751;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=spHUr3AXu2f0Q/mYO04AU9/9MDHJOsZPrNXfPRcj58M=;
        b=I6FtY53OqSRHY2Uwcm6TUOuXIA/ANqbEo5hFKqJGlcWxQR8mHBUJE94QGFPqFJa9Gy
         EDlJUCjrqJY67uKSO8IMy8kTL/PIPhfcjCz4uk9HmS8HhLYO1KQ0uY01q/jiy+eC9gRS
         zRr4+bGtcfJmu0sl7Vn6YC0h/bH7zQZhW+ZGuFdhT8snqeBZKDqXjhg2SoV8mDtHrIgJ
         XPu0MpJF4LPIJ1LcA4i9T4RotHACx3f5W+y4pkpOaVUt3Yolzom4stKuzyaFntV0wFxX
         E2VdKMx9aqWk60WTzG4WmEZ4gA5tj8kkgeo+tYPM3KN87VvHlqZ6iWxXZwh1uveZa+R3
         JX8A==
X-Forwarded-Encrypted: i=1; AJvYcCUmRbUlmPnnpePp0P36LuVwOK/iFjsoYdadZaEWuB5cSDsugf85jrp0S2hvFkFxAlIBQTiPgc0ZfpBJ9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXneRcRNvIdpgled7DYeY7uNbrbXfgftwPxzKzDmXv7tobsFxn
	lc6DgGl3gEkOIdrdNuP1bOgaAoPGeU4lx3ReCPdNwtnGe33FFB/M4iHvMH6dATp3GXNJQJdu2r8
	BLYg5IKpTTb38xzQm0BfYhYtEOAJgrRXncseNc6ln912J6Nh6kBu3QMrTuzkpMA==
X-Gm-Gg: ASbGncsUrqZpZzcS5gzyfMgoCvT8apqi1KeLn1cbA2zknyHTUv6toY+0Pwh6gMZzso7
	C5/745+sf6AUs5kZMC3Kt0cs7f14BOTqp2R1F57jGfd/iKpjUK04/nh9bD+ZIez0/HvK3GiYgL/
	h9iRVZBdATbM/FB4+5wwgOmWMpNoJ7lyYZEQ8Nu4rSoJwaX5qZVTQF9XZGwckaarDjMK60Ro4wG
	19PPPNY5wpgp64zH+y3audNmTfhI2AvGDCbHZpaLm1z1iRCUXQGZZeU9P3wEzyIhZ4bsNq3Sfn5
	KJpQPhg218WUbeo3+Tu/tALX3ESRcPFJ5irKydP6nuKvDwy4eLux+fLVfNL1u9E991a6Tw==
X-Received: by 2002:a05:6214:21ca:b0:6d8:99b2:63c7 with SMTP id 6a1803df08f44-6e6ae9a12a7mr104618856d6.9.1740591951736;
        Wed, 26 Feb 2025 09:45:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEoiQ5KxqxulmOEbv7ZhtbSVl8vtd+3f7Fmtz2NRViZu3o4YsIbbM/qm/sPMHNIsdwdfvGp7g==
X-Received: by 2002:a05:6214:21ca:b0:6d8:99b2:63c7 with SMTP id 6a1803df08f44-6e6ae9a12a7mr104618696d6.9.1740591951315;
        Wed, 26 Feb 2025 09:45:51 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed1cd5629sm361206566b.8.2025.02.26.09.45.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 09:45:50 -0800 (PST)
Message-ID: <99ed4a61-6e0c-4743-91a1-2312152ccf6e@oss.qualcomm.com>
Date: Wed, 26 Feb 2025 18:45:48 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Add PTN36502
 redriver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250226-fp5-pmic-glink-dp-v1-0-e6661d38652c@fairphone.com>
 <20250226-fp5-pmic-glink-dp-v1-1-e6661d38652c@fairphone.com>
 <696aed52-7519-4351-a3f6-7b86778b18c3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <696aed52-7519-4351-a3f6-7b86778b18c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: F7IV67uF-h8sW9TawxxygZsIrmXEeM5m
X-Proofpoint-GUID: F7IV67uF-h8sW9TawxxygZsIrmXEeM5m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_04,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 impostorscore=0 adultscore=0
 mlxlogscore=846 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260140

On 26.02.2025 6:40 PM, Konrad Dybcio wrote:
> On 26.02.2025 3:10 PM, Luca Weiss wrote:
>> Add a node for the "Type-C USB 3.1 Gen 1 and DisplayPort v1.2 combo
>> redriver" found on this device.
>>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Actually, please also rename the redriver node to redriver@

Konrad
