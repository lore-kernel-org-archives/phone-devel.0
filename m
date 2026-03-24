Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FC63FCB24
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 13:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774359589; cv=none; b=Glnu6pvtQFl+WoZzsgG+jGtAiyfquVatdQfs/x4RgRZfQyd+ZGIdrIYmHy4dqvBYv212zHjp4gM1ofmtejvNwcpJdDmgHaTd389+74IVlv58FDofs0hWuh+OfRavIATCzPq0AEyYQZqxW32Hcvg7xSNEL9NmZQ3vz4TO8jsa5dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774359589; c=relaxed/simple;
	bh=dr1tvWY7ZMmEmWK8yyOSc6Ec+cf+WDspG2nMVqEu8mE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tvNCIqFrnx0Ygnstwo+JXvIM8qOwE6htbrSBgz34l/l+uNecjreMd1Isub4ykbtBMlbfmBIfmuLEIB4JCERfxJQdQbf+Key3W3alHIbk5CD0MEmXA66jLcFLEAO+2z1X1c+2EFhMMittIOYXwO8bkyb4is0AnngD7/98e4T7Pc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aJW/QyDX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e/ekz+xx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aJW/QyDX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e/ekz+xx"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ODXFpL146415
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 13:39:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DFKGVncG92dG4KH7j0lXCWsMdOyw42ZEb6lpcZBcVeQ=; b=aJW/QyDXCqnqIZb5
	y8nl2vSiaU9XVtMhkQY6JCmkZiloxRRBteRKdIPMPxXz+QqkIBn83sA5TTU76az7
	FNu0Xd0AQP0u7Nr4tku1DpYweb1ObOFzL0SvIfEhNBzufLA8KYavDb7AEnHLwaXG
	McFyrW4qnDRhCqezXD0pd2dtQSLGqIIpYOGBnP6m//Dc8kjKBms5I5xeSZtfvPR3
	e14jhnOVPqqRhpLHKQAZBkzyqg7tbNi2VT9qGP9FGL0kSy60XzV+x0yh9B5MEZbX
	NVnL2zYkFp6HVliNDv10jG+LABqtIy2kyiEwQjuXjucfCmDCroha3GBqiKXHtvA/
	wfclVg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3ukm80um-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 13:39:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b27636835so50882911cf.3
        for <phone-devel@vger.kernel.org>; Tue, 24 Mar 2026 06:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774359586; x=1774964386; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DFKGVncG92dG4KH7j0lXCWsMdOyw42ZEb6lpcZBcVeQ=;
        b=e/ekz+xxImacvRN41X2qiJfn3M9WUjlKOjqG9hPYOjgG85qQzizKBR7etGEFMITQ4R
         f6MGBkaYQR1AnMyP+ex+vZrkRgJGdKMeP3PfYvnAPdnAZlNcJoEhgCd2BUD93jscsG5R
         YRLC3a+jvUDo0SEfGEBmIEY0ayFEdLJlOZCgj6ltO9Vak4B4Opef4dd8d7ezVRV51U2f
         sS4Wzou6h9gQzB0KOFe5sdYJWq7fRFKuhtQZNMVuRs3QqKgaO8oK6Yt8i8iE0BjqXg85
         In0oQ29ij3LRdo2suTW+YjnXBnwuXNBd+RRMItSTbqeZ7a5zfqQID8NTaeTIWSXwx35G
         eKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774359586; x=1774964386;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DFKGVncG92dG4KH7j0lXCWsMdOyw42ZEb6lpcZBcVeQ=;
        b=p6g+aoA5FP7kuew96K49XSLXTxVKL6CC6bF/51gOjkK0tRvAeMo2OukM5GOJZruX2d
         30Qgbi9FNxgvzIuKvYgSXbV622CtDuzkWTfvJGBJb67brViXP+snrAf5AxdItEXPGcbQ
         nEoZyA9O+9nqLcoIJmHgl3Kwx5+RsrsDHN5E09k469iMbXtHtPlaSkFUMI8Bljzj9xZi
         BDL5lfYvsy124SAY6WAvVrwa8LdMEQmUNIioDmyCQGwaXxImqjyDvYHUZ+aJTGPl85y7
         TZD3WEcHj73MTHQbPW8UWMA0Bdy/RjRTlescx97ltrlUw0cRFRVoUGPwCfKS8Sx9f2zq
         QH7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUSw2Vh/+urff9NtKCvgEm7L0bP0OvWV0ocHJQxiyK1Y2ZjK/FUwJe6TK71ee70B7UjHgib9wDimk5SZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDt3nsjzvIHC66ZH7ebPBT9JZQvojJt/AsVpffmC03lsNG3Uwd
	yMFNZkAqLv4o7Qq6wWS09kUUcf27LbPQXAW4NQSlGYPlPZBcVd2138FVv7+U3qEzMYL9e+EwEAX
	Ugi7ksyNQ/W7g6fANMS/3jlaJ9H4duMfBb2FYleHbed1yysgipGiTjEy6q250wx6RiQ==
X-Gm-Gg: ATEYQzxqEriluqKm7AiqwaOkY//MqDWoCKWChvOcjy/rgbaMbG8SW1J1NEvwV7J9Zco
	TCAfnX/OtYXiXTrB8VROKDtKp+PAjCpoho791PM2VwnSFtE5dP3XgS4DlKbfNkLQhiRKgb0pB7o
	ARv08TL0spHyjzkCbZK/LhGXdzucc+Sekhh/AASghPjUziT4jAUTQ+W40wx8wHXDa0GUTgdJdE1
	NDKOh3A67qaPr3bCWzyzTsfdhzp3QCFxTw7Sx3dK3k5syXpDl2iRNBhApdwlY5c37jPrsu6RAmq
	y8v/kCHTratL+J+NUhc09GFok4NQNURO0+Bh2e1/kSh4DbwFNW7lgX7+CJZithRXjceUo7eF1Qe
	grCvZIvwl38cqkRL1OjVSwJ2FaWTpASSNtAf/GSKuxQNSl8CjD6HBKE/W/F6hsOmgchPz2W6f+c
	IrO8w=
X-Received: by 2002:a05:622a:46:b0:509:2a92:8088 with SMTP id d75a77b69052e-50b373d0bfbmr201484191cf.1.1774359586395;
        Tue, 24 Mar 2026 06:39:46 -0700 (PDT)
X-Received: by 2002:a05:622a:46:b0:509:2a92:8088 with SMTP id d75a77b69052e-50b373d0bfbmr201483631cf.1.1774359585842;
        Tue, 24 Mar 2026 06:39:45 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335de3d7sm648605866b.36.2026.03.24.06.39.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 06:39:44 -0700 (PDT)
Message-ID: <012280c4-48af-4b3a-83a3-c93f01e52625@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 14:39:42 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 15/15] arm64: dts: qcom: sdm845-lg-commmon: enable dma
 controllers
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
References: <20260323-judyln-dts-v6-0-d89f07897283@postmarketos.org>
 <20260323-judyln-dts-v6-15-d89f07897283@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-judyln-dts-v6-15-d89f07897283@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69c29423 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=nrrofH4WB8OeSbHxBjgA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: mYuBbsdxTwD9txX1IerOaID7pcBOLoCj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwNyBTYWx0ZWRfX9c/Zv1BjyoJv
 YnrxqvL52rbM3vrzqc0H6JeKIJJSfvS13QJDKSfLC8buS+PSlCBl2D02bbbBgcfucWU/fsoblJI
 oTAgzvpFVF4bG6AgOHko4p+TQqvCbdrzqxurKF9FAgo99d7hDlpRqvCO70zE9IV+fEdfKtu9Vgv
 9s6NQjbl5H00J0PQz6YKg9DRsVV6EHZoEI6KOfBKBZZ084fSZS0BkXDTQmhS8z8UzM7T8c+Apqt
 MVvP30bX0BVXART554v6twPzWf8cuZyAwYWiMO0tLxIaHmSrAgazqo2ceU1hxHivcB6e4Xm2Q86
 jGp42g/XAqbo/NjcxDUhwOBjuf+rB4bbhkSq+UGlRpILMcW2yxjr8EkjjlED/rYnE3uvBwN/u+5
 uf7uF4EsK3Ux+Ze34LmvW67fnUq2GZytasOCTah2Us++V0siCqdmMHMMTeJnacSbN8J3TJof0v9
 RiUc2dPaLW84j3e7AWA==
X-Proofpoint-GUID: mYuBbsdxTwD9txX1IerOaID7pcBOLoCj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240107

On 3/24/26 3:42 AM, Paul Sajna wrote:
> The dma controllers are referenced by the geniqups in sdm845.dtsi
> but disabled by default.
> 
> This was causing issues with the spi touchscreen.
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
