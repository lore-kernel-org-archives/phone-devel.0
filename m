Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772B81CAA6D
	for <phone-devel@vger.kernel.org>; Tue,  8 Jul 2025 14:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751984168; cv=none; b=PLS64SmD7H4/SXwayThUsMsDO4mM5nMbtcWon9PWJIw+lZic3U0COq01gbHnt7ewQl6yHGUV6ijd7nV+lmQXiWR6tWPeXw5Ptx3wKvmdUVBoyPW11AYbE42Uqa1ZvZ85DlG4mwTyzIj6YS6p472ZfNhaTVSzTRIzSsU2ueYNUkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751984168; c=relaxed/simple;
	bh=E3lfaH1esoHl+ru8dt/bh3KVLlHTXxish5JJputhM/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jsB5jBpU8LbzYGf3dkpbA15RXTSl8A4Q7BBhDrW7EVxbmkCe8k4e2IymL2PP2gKT1jscv3bh3nC4+ypssIIicM57PGUAo0Pk+uI5vuUpgJoqXe3t5R8BoqhfplKoV3r4cyqfUrgVcXRYgwrbjmLugnRRPa8QEUYMzFFKpOe292E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QiG9r98x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QiG9r98x"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AANmh030305
	for <phone-devel@vger.kernel.org>; Tue, 8 Jul 2025 14:16:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DZQVHr6h2vbACH/HxbUVPyBgPPfJWbpb9xJOT/3ejgk=; b=QiG9r98xOc7yxMot
	4Pyj/5ng2VQ1vd/ThuyA/rlbm1NoQ+H8jlXCA79GkKYltN7+HzFEpAk4lLCKZpkb
	HgYsUW6I7qS4xnWzV+F95qUKIGBc7Gjkpp7FT1B3XgrhIWeSCrdodkaSN1nqrnJm
	8Mt3uEi5H1I6zW1xlKpC/WbNtMo2HQldVjR39HDMHYKHt253f8rsIOz3SDZVkgXm
	wLb7KHy4jQcW82z8Uloe0ofDSodFHrlEoHOUVkQ7w8wGgzivv8t8R9jZQ1nBHsCU
	YY25cDA7AUiwpckwupN32lKA023RqQK3bPd7OsWP+UlA5AwYjbBHW1iBkY+NCJTz
	SKqL8A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b0urun-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 08 Jul 2025 14:16:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d440beeb17so48221385a.0
        for <phone-devel@vger.kernel.org>; Tue, 08 Jul 2025 07:16:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751984163; x=1752588963;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DZQVHr6h2vbACH/HxbUVPyBgPPfJWbpb9xJOT/3ejgk=;
        b=R3BWqWoQVT2xeFsj87hMR8g62Hi1WWO6qbVo5eNZUdjxvhlLtf5HnYwTbeHcUcWrrR
         ilWgj2u6v0wNGtsmuTDAarzKumXby1m7Xxm3r9dFMH3I8DZeGtXE0bX6IjUI9h6UjmN3
         qwBdNi9bZG1V53q/sX0jL+Vpq98h3BtgKN9lvYZegKAS6hvOl6v0EH0THdOCZNbOQArM
         anpbUlLCIdbRvfOks/C9SBZG8VR0RlxlsMVkNzbf7vIB7XhOuQ2X0rhr45IEEanJBboH
         MlTYGfKNQYQOZWQFoqZHuRj/TCEhZAr5iJzUO3x9F9qWkYa4aB/K3zaWUkxFrzwws3Jo
         XYwA==
X-Forwarded-Encrypted: i=1; AJvYcCWKtx6NOPUD5E+hME0u1Dm5akOOqgnM3I+8CBSBPos/F6WuTfjWJHXpnujr1T+msrSBnpi0u8Cw69qz4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYssMhadB43krIPDUkybqEnIRzz61zUyEXqwUXMmEuYrLapqJ8
	J6ewEGu/UoqVacUme6Gfw7tAJewoFfeOzbBnmRNmhrDTa+PHMlz+7cW9GgU9/HweqzJLDVmgdEW
	seoqZDmzXU6RXHgMNTZ8+UXVrMaShgNTkhH+VoqqLWQEwCDoLKR7tR2rj6QT27PFSV3Qkao93Lw
	==
X-Gm-Gg: ASbGncs4M1yUOWAOzvjVpnWsGQPAREarbfur935sNaqG60z9cgi7C789Y80ROaqKq2e
	V+Zj+uLqVh8xZUoDrJNtY2I8hKvVq5ff8x76S6GWFqseMFaUYOBstHZRg4+lG6wplIiDHNZe55a
	fuyMODfQh1y7Yso18TxkmaVDKtp5Oq6v4cIAwszXCBZDG1fG5NhUbyxWplfuwur7qXC8QyeRwyn
	Hf2sS0RUzA+5btXgD2B79+qmuessj5UxCJkU4uXO6MyTnhBL7UwKrfXgCuvyWfmzLto3rKrUFfk
	TxxgHWSqMAX5fr42etw2Y4k5oM5W76+Bw/PviYY4FRaDPp82zCRVySTJfW6Z8Ml6Qyx0BRwruVU
	ieco=
X-Received: by 2002:a05:620a:170a:b0:7d3:e9b7:7121 with SMTP id af79cd13be357-7d5dcd42af1mr823710785a.12.1751984163007;
        Tue, 08 Jul 2025 07:16:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoRxKnbbwSsxFhWpE2/NEaVUl1RaxHp0HVlyQd5O1NsiVnVWQKCituQF6abehsg1sXoy3qKA==
X-Received: by 2002:a05:620a:170a:b0:7d3:e9b7:7121 with SMTP id af79cd13be357-7d5dcd42af1mr823708285a.12.1751984162353;
        Tue, 08 Jul 2025 07:16:02 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383bae7fsm1700290e87.50.2025.07.08.07.16.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 07:16:01 -0700 (PDT)
Message-ID: <2ada89b4-adc7-4462-a9fc-ebe692623fff@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 16:15:58 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: qcom: msm8226-samsung-ms013g: Add touch keys
To: Raymond Hackley <raymondhackley@protonmail.com>,
        linux-kernel@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20250708122118.157791-1-raymondhackley@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250708122118.157791-1-raymondhackley@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=686d2824 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8
 a=DCnaCfRbCLLe1x2JEeAA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDExOSBTYWx0ZWRfX2dPnQ18TS3Jk
 sYvjBfTaE0c/GD7xrPCAAPjkbRpP5p7OGpjfjAv7cfS9C1H9qrm7Vd3BwdAIrgv6NS8SHT4T9Co
 EA6InX6sZoJs0UHDP6v8RIkhnnV1gkoqXqvzwi/rCbbpATHMU6u3AZ1q9J119unDNupeHojI9hc
 yjZnQh3ZZ+wnsyy1Yw2v2eZZDqkcj5i0FFkz2SNvtEi8iMf59NWBE9PLi5FOb7FNaYDMS+DMdoR
 S+Xd+gnEtYnN+IAgYrfQ5BMfUJd8Ljp0xxu1410ovo1cBBoT2J1U0gPpltsvhTrNpxBTsS5h8P2
 NRSG3Nt9x8tbYx+QuoUrYn5P9k28DmoLOv0mwWdBwXx+O5Sx+A19kWEewjO6aNc+uMjfYNVXoYC
 itdj8mxLXQAgZ9hqZacdLURJXyl+nt9uLbwOgMA7Zfq0D4+9T0zL6Zbybs2I0FtFz9ApCM4g
X-Proofpoint-GUID: gkK3Ke-LkBP9HxLoNQuAuuwQezTceaqN
X-Proofpoint-ORIG-GUID: gkK3Ke-LkBP9HxLoNQuAuuwQezTceaqN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080119

On 7/8/25 2:21 PM, Raymond Hackley wrote:
> Touch keys feature on Galaxy Grand 2 is provided by Zinitix touchscreen.
> Add property linux,keycodes to enable touch keys.
> 
> Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
