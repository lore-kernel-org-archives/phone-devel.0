Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F5B332A48
	for <phone-devel@vger.kernel.org>; Wed, 17 Sep 2025 13:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758116817; cv=none; b=aavsKHK13Q+AhxEDkQQKASHcEbe7IlSL7KWNVSBT99lxEDURPOmbSafAfT1ZkmT7Ha5froqXOtsuCoqSwZbhOZ1WsKRBU4iSsiVl06vfedoyzHYQl+eXB7qHSwleUporNLGn6cWz3SR2L6iA4as6shBHWuXdDyG+vXSUXutOXTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758116817; c=relaxed/simple;
	bh=RwgGuPyKTCBSO/iOJFj8LyqIzyjQZ0GGQTuA4gXXKac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CDXc5nhi3bv6I6KTXmuaaxiYOVOZytowqMN8148GmKP0k2YAem545J5jobLnRwCU4UhDaKVE+Fn0hUb0pVJsulhPNxuiDpRSEkkLO3NlN8my3JSAiUJ0p/FOGC9SyLLsgkgCpcmkh4Fq1KA+Ajfp+4LvArplzBviOFpvz8et/OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IoCueL3b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IoCueL3b"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HDG18P003283
	for <phone-devel@vger.kernel.org>; Wed, 17 Sep 2025 13:46:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RwgGuPyKTCBSO/iOJFj8LyqIzyjQZ0GGQTuA4gXXKac=; b=IoCueL3bfrp2DYCi
	vLUHwjwAW+ntbPQ/dCh2L0sSb9z8DxcyJXIYgHEgzZHBLwwVEwK/D7Zsf3pj++5k
	vPN/2xVzXQV13yjg7Hz6S0k4Y2CDvcDt47xz6WU1BNZ7IcZFDBGewM1UK7aJS2lt
	+wcPzJBZaFx4Y/PKif3vb2H/2TEAUUNcqsPDNuM5Bsf8Mj1kMs4S05C8PwcZbgQV
	YEk8bband0KNIvovShfngB9UvD8AEQCH7j1RNsnYrVLhv5CDuF8wuX5GN71Usm7z
	r3ggXbv3bgZCtlFBy+kP6nMQpk9rPKbHoqRZRonK8SclnzkQK7yLFA6eSEBuIM3S
	T616oA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497wqgr2mk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 17 Sep 2025 13:46:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b79d7413eeso6527831cf.2
        for <phone-devel@vger.kernel.org>; Wed, 17 Sep 2025 06:46:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758116814; x=1758721614;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RwgGuPyKTCBSO/iOJFj8LyqIzyjQZ0GGQTuA4gXXKac=;
        b=uNDjmEJmmw/mVt5tHRtgpyjU0/cyjZXhoP7EEqZiBqHLu612Cu9C1WAmXsO/J5TvV+
         keqvYzdY3uQ0fpiBW0Wv8jnNYOLLUvh20cKchtl9y/MNXuBCN2LEI7H2diKkt/gwzbOW
         zyt7i9SB1Ku4hGbE5ESlhRVUczteIvQuULEN34+T//o08ufYSqF0seQkqkoaDNWQsd1T
         FTQpWiLkn5NWuwCaSjXo/WS25+XQJw8EN+5s2tgQMnod8WC4XJVLJcMqAwAIB7Jpg4o0
         EA6T0qH78ojaaMHV4lLtvah9eacxnVXEca7B6etATBE8tdxGyml6b65O8QhGWbNQNwci
         ZwWA==
X-Forwarded-Encrypted: i=1; AJvYcCXnixNyqSbH9xHUDQq/U3DWZlYeHf2JGr2Iyj2H7X0Z6r8Iq8kQwhT7w7P4T0nbx3FLhLov+A3mrW2uzA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo38sFqjIIqXeonNH5X69hl/HGu+sW+9Rl5PzBE2NJP2rszeIm
	62tQrTj/FpTPiOQwma9jZX0Fmz3CXwI60uKRrzihxxufZuA4qumAArlifMhyMHntvkiFmEO9H5T
	mBLRlEO6J56X6MDZG4PpAwzeulhAbmoUPhz3MD/ZERKkGluebZZuo7Qd12lSTpSZwBw==
X-Gm-Gg: ASbGnctVIoite2EMyW6w1dgk4bxnexVqadgZEFwaLPw/KNlAJGkFzWxU6dLN4Jzjsc8
	PWnJfqQcMpOTPFIvgG9NU4Peby3LmrBFCzJjfYuu1WjRQSaK+qsKhSawBkiJJT0dg4z6J3v1+ix
	btQqmb7P7fQRQKkm9w2BCmfeGjfiUejvLwUTcE59PA7cacI84NVBFE/exN742qPaK+9mt7MDxma
	+A/sNymZGQLVlLIDBhyuCFuw9TJ5RWfYhOr91HeeHzxocjDXqEWovObQ0/DWLHJIDqBQtZmp8nU
	VsQi0PlrYkXbOEN/qVhZTWPLqr/4fjeT8Y7IKy6Eyxzmipn6XKEMlVolpPwc8G3tcNQqCi27+fp
	z6hDH9uQyiVFyrv3GSx7ePw==
X-Received: by 2002:a05:622a:1a9d:b0:4b5:a0fb:59a6 with SMTP id d75a77b69052e-4ba65bc2015mr14609931cf.1.1758116814188;
        Wed, 17 Sep 2025 06:46:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGU9SK9QoEi4qqIyWuOLrD+1Koi2QQZhObu9zrUg9uyVY24N4I01Bsoa7ag79322ufzX+ZsQ==
X-Received: by 2002:a05:622a:1a9d:b0:4b5:a0fb:59a6 with SMTP id d75a77b69052e-4ba65bc2015mr14609671cf.1.1758116813649;
        Wed, 17 Sep 2025 06:46:53 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62ec551bf13sm13031804a12.53.2025.09.17.06.46.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 06:46:53 -0700 (PDT)
Message-ID: <adbbc9cd-dfe7-4983-865d-d311cddbdbf1@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 15:46:51 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/13] arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
References: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
 <20250916-judyln-dts-v2-13-5e16e60263af@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250916-judyln-dts-v2-13-5e16e60263af@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9VAO0KccADSFubgIrNenN-nMEo-UaaBj
X-Authority-Analysis: v=2.4 cv=HITDFptv c=1 sm=1 tr=0 ts=68cabbcf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=cdr5l01el_-Pmc56AxUA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 9VAO0KccADSFubgIrNenN-nMEo-UaaBj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDEyOCBTYWx0ZWRfXxJjEVF9wnzmr
 +TN9JvNYl6InkjKVqxr/X6TKMyKfUCpcKw5/ZwB/jnb6P7iR1R3iutGJSjRMq3mat207GMzRsDv
 SJ/m49/dAiqXaR8dUuNooVxllXhML7Q+Kz7jL3zyNqTzkcJPhwKlara0QY/0ZhZm5nyAwyvFMXo
 irA2J1+QUlA7FK7LZMUDQbeUuxwVJliIhNnj0ok4ZcOt/AvEQJREV5rs2JjNieUZccb/ysIh85O
 +WRRmiqCyj2zqnjpngyo73O38lFaIKMOjavm+rA/wtnaqrXWmUy9Td0TCKMVBAMRu14T2D15FZN
 6TYsoIwxPteQgKPlojM///le4AdeOVUbpCpL+KhZBsddP3oLg0WKep+LZRcNUxgqCafsybCB+kP
 eXaQa8DK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509170128

On 9/17/25 3:09 AM, Paul Sajna wrote:
> `regulator-always-on;` in ibb improves display blanking issue

..but doesn't let you save power when the display is not in use

That suggests your panel driver may not be sequencing the supplies
properly (or maybe the reset pin/commands may be misplaced)

Konrad
