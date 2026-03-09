Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17071377EC6
	for <phone-devel@vger.kernel.org>; Mon,  9 Mar 2026 12:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773060957; cv=none; b=MS++CoUMyKX8fCpGmAFTgNfSL9nJw6Grmm1cb9V906onqItUnTlKDQrJ7MWLZ5tkmfD/3TO1vaXdg8bV5KKOhNXyyjozdNHbPGcQlgkorCFeKqA1dmlo+rxu8TI3N36IO0hWaccWeGYvrlugpSG2Z4pJ/OWRjgnbfE7AKtBUvLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773060957; c=relaxed/simple;
	bh=7l9aO65EcTRGU9RFNHMLJuCfsf0K5qvwAMtDy4ezTQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qdADynliH//05KiBCDFMkUeE4eRs842zyjgCoGiutMKbnCHgs8EhwTkEY0Uv7z85NRy8JMiszEGm+X/pKkvXD5+wnkiKgDNXWK1RpSoaIlOeCfoZjxlAs5niDV+6KI9HPbhx4HsXyRw8xvI9jjRjgiJhiucUkZjXHiqT37rVS9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cqnxo6iF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jgIZxtZe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cqnxo6iF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jgIZxtZe"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629A6hs72195267
	for <phone-devel@vger.kernel.org>; Mon, 9 Mar 2026 12:55:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yY6MMt9NzfzjlUmoi5wtd94wNXGmWs2VUQczc3QwC/w=; b=cqnxo6iFVBoSK4JX
	+05Sxo9eIrYt1hn2pOv2VzAxE0w4m9V6NBaZiw8k09psHlMNA1xqdRPyr4hl3umH
	XZzCK6WvyJBkvcVhWCAxPpXCD/gdvsa4X3Et2HxDO+cdUl1Gxh4J9ayAlGu+AkBp
	9l2l3ubaOcutlpTgDRFBS9nnDGubAtiYn4wRggz9/gz+pxARweph+p4nCKLoZ2QQ
	8v3JOZTMJ9neRRaMxGnNF9Q8BMLLBa9S8vatEvfc8nuTjzATW7hNoiCGiLYF+3eg
	ULwD+gFDv8fxr4ddx9RHZv11bMcwiQrFcaygtCHnOtdRBFfu9KAK6+2BAakF/4pV
	91pjJQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csv5u8h9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 09 Mar 2026 12:55:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7a2c535eso83983785a.3
        for <phone-devel@vger.kernel.org>; Mon, 09 Mar 2026 05:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773060954; x=1773665754; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yY6MMt9NzfzjlUmoi5wtd94wNXGmWs2VUQczc3QwC/w=;
        b=jgIZxtZe+uMqFNvrSmqXtFpWZ4tZX5G7LfjKiqK6mNnb/RdEcKt1kq0nRw6xbhb2Mr
         CHAhWzMZ92nVFWalzzUUhYG/TXyJg9UVa9t6ztpmyO6+IOvbUkX7+EV3jMFQgcHKYv6a
         8q48QkzADAOyCEa2ovVHB9Zd4MGBKf2xL+ZDdflyEf10l2dIgMQoH58nz74tJggQnXxb
         0Xj/HUQUqeDp37Eadm4GEl0yEI4uJc0r9vcbJ+r1MusQDGsgoKydMn7fOqgUDHdIyE9G
         G74WDlYcqzFdwnMI71asPFjMbJCBjeusg9RaXQDgMMdI28hUsyIllIRMheQ+g5KG9gUd
         lyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773060954; x=1773665754;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yY6MMt9NzfzjlUmoi5wtd94wNXGmWs2VUQczc3QwC/w=;
        b=OMTDwz9XAs5hZF4q4jlBXtHZyZmLEAEt5OxzIdGELrpit7YjDrUbE3xYPktbYD+NIv
         9TTCDq50qLbRVv2OhGWzQLLfKGESstJK0uHnaosTX6GTgqno/VaOCsPbLJw0RORejdJl
         NbuQ+Rju/RyRXZcCV3iDrFqUnEj3Y3cYxZ/FTKh0MCxxwGYhXKlDmYep4PfJ0I+oV7Ts
         ljJ4BcfY6YXm2m8f8hGRMDQDkkRpI4QWRVoPassW4yWZEEf9SJyZT8KefaZgQYWCg5DU
         7X/2G8O4s1xgsdTCg7Xmk/SEnGA4t8FqEgtDnzmc62LpC1ibTwJcHBy7Zd9VpCQuzHbw
         Yfcw==
X-Forwarded-Encrypted: i=1; AJvYcCWer3EGVMtdtgHSLWzwOVHtVVTKK7Ei1rIQ7cOiWNF4uAUuwPwr4M6erdIBgoG8lckbhSHpXxXyov2Lpg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4J9Vl19gaItUawV2tH62Oo1jZEpFRIFc5mOKppvt7zJ12Yxoh
	d8B0/mzw2hYKSqynScUlsCx1lsljq2UgNnJSZ6zqtq4oXeDN9OdSwwLopln8BPacg9dbIoAZMnF
	J5EFEbA8gOsp2KkxwvyvLGPGg8VTgTDEdbbwcKLkII07GaITSf02sK0xNyUBSWIjHZQ==
X-Gm-Gg: ATEYQzwcMwDdXFPRcyBkugM3rQe3yoPAFP1P8RU4d9xyTgsZ3y1uLm2yFuLdyKJj5vX
	hTCqLXtvMNbUE0MBvo2LWkHlyfCgQvG8RhkZIDwE8Vv0QIc585pmwSuX+boIHKQmybanNI7faeZ
	I6FUIuR5YD+zQv5OL1Jy3WqKNMEAHBVa02uMv/uigxvczTay5Aa06znHkH3qXbupVnxkiz5ThwH
	1iWTtp0CLPgrX2okbBvAZLugZJ7dHFHEd5tX5VMzeHwvoNei3cg90bs2VSmTqa25iKy2oqS59jA
	WC8BGK6BvutrMtAKaXVNrBiPB8muZzoOl1fFbVYECHrHXWhvatVZdYTsw1DpPM+heoIA3BmFlS6
	O1tq17pj4DULCwHzECNJKW/mADfsP/BC3zNAgNNmCxW6ilRciMHH1O1j0B+BTBAfVFON0pVfS6O
	Pik7c=
X-Received: by 2002:a05:620a:1a83:b0:8cd:90f4:326d with SMTP id af79cd13be357-8cd90f43559mr89037585a.7.1773060954480;
        Mon, 09 Mar 2026 05:55:54 -0700 (PDT)
X-Received: by 2002:a05:620a:1a83:b0:8cd:90f4:326d with SMTP id af79cd13be357-8cd90f43559mr89034485a.7.1773060954089;
        Mon, 09 Mar 2026 05:55:54 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a4fd5e87sm3224131a12.18.2026.03.09.05.55.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 05:55:53 -0700 (PDT)
Message-ID: <ab66ac70-9c63-4dbc-9ec4-8dc5344fb045@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 13:55:51 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm64: dts: qcom: msm8917-xiaomi-riva: Commonize for
 Redmi 4A and GO
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org, phone-devel@vger.kernel.org
References: <20260305-riva-common-v1-0-436f1f4b7399@mainlining.org>
 <20260305-riva-common-v1-1-436f1f4b7399@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260305-riva-common-v1-1-436f1f4b7399@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: MDzzjk0xBeE47OOWT9UGZiUgX_YNfP7o
X-Proofpoint-ORIG-GUID: MDzzjk0xBeE47OOWT9UGZiUgX_YNfP7o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDExOCBTYWx0ZWRfXzCcbW9vp3kHP
 jcMaK7G1pEISfWkTxZwlZgjGoLe7L4gtX/39I+oxn69U7b2gkNCa/HUilwjY53zdCe/0TDCYgyV
 EEuOtf/EUEw/rb6/Mge6gkj/AgHwjKq1M/iZQE5Q7m8NuBBnrOzfozuUSHZ9PoD8Fcl4/PMdfcZ
 Kiimuca1nxVgB81P0KsVpmPkMkC9JM7MTJ9D8qxf8PJ2CGzRS/O7Ec1gKz330kGGRDCi7/ljsAi
 iu8m4Zdd7neU+Svfwi+G16dhEdiCHXBKeVemFU7DwiL4nI16CKwt0tL6oVZtylabGXUI6sXj5ZP
 7MJw0DdMMtBbLn58bsZ5Eq9cN+Pw3RTrs5apcdJ0ZpmHXQ+tFflBaFRl26+8oGEQIjnJCtZ7jjH
 4GenQgRYi2FgZtCDlBbS1JUsjEp6R39DqlqyiCGzmTuy3JrJd7LIZ7mbIVKipkg8ALTRPeVMteU
 nyw+oKX6N8hjp2Eu4XA==
X-Authority-Analysis: v=2.4 cv=Xr/3+FF9 c=1 sm=1 tr=0 ts=69aec35b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=OuZLqq7tAAAA:8 a=K2AvnHgvSaJXUkDQH10A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090118

On 3/5/26 6:28 PM, Barnabás Czémán wrote:
> Redmi 5A is very similar for Redmi 4A (rolex) and Redmi GO (tiare),
> it can be commonized for avoid unnecessary code duplications.
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Could you please try adding the following to your gitconfig:

[diff]
        renameLimit = 999999
        algorithm = histogram # or 'copies'
        renames = copies

and see if this generates a shorter diff?

Konrad
