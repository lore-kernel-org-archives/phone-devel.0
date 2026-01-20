Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DBA40F8F6
	for <phone-devel@vger.kernel.org>; Tue, 20 Jan 2026 11:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768906847; cv=none; b=eh6ycwsbLq8wbeA/tW5DN8+rrxiWoM2+4DpHmtJEw7jNFMFb8PPClgZ6tybsZC63n8DPOrhlud8zGePZZpw5NGiDwi1Q8H7TlBk80APZ/mXJ9ZEmzbYaZ+/DAec/kRwS1Gn3T+YcKxcw+A3PxWpEQj+2Dsm+MgAS6r3rQ8cr9l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768906847; c=relaxed/simple;
	bh=O46rSJlea/SajDU0CJ0HrX7k9pM7TZlXxm7PxEt0hAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PlTjmIQbNPf6j8ph3evDDb6iVK5Fi4iuAI6FcLNFy3vqFvmXiUHH4Kw0+dGRRcbGTi9spc1z6yqZ1IDkNrRJd9RRAj/f9iZ3rR3nIKueGSsBzPaisgm8brnrsFG5svsR8axCh+vwqk8icehfuYwUkfV4WrynCe7xlcr00PlwDtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SBCdgDDR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BOLNDHGT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SBCdgDDR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BOLNDHGT"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K9l1n71347160
	for <phone-devel@vger.kernel.org>; Tue, 20 Jan 2026 11:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uckr27RLbm3h8w/yqL5p6ZXMdJeaPZyAz9adDw0oykc=; b=SBCdgDDRB7ddlvY9
	R1a0+xdtP5OD2wPh6jVv8cHBQqhKdjp2Q7CgdLd2vA90FnlyZ+DpBablDPU7Ykma
	fP/VHhPzcQqeQYHOCjsxpylok0iEbxQ2J/0h/EwNjoxTFOSAQsCo8eWrJlrcpY5B
	nU533isvtDc37zJcCCNJSuVTRNju3+0CGCYEP3Fith6zyLroY+x/nw81tZdobOit
	23qW5EV3UvH7iOqSNusRExhhjiAlEWqjbaMo1ySeg9l/cHNyQ8ms8veAdlVtEG/i
	Az2385lYgPa+o52q2oCngr3i6sz8ixTCz1377k5Dn2OZ9W+nXMDywNH2ZpCQrFoj
	raYAQA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsnpdjyt9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 20 Jan 2026 11:00:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c231297839so110653585a.1
        for <phone-devel@vger.kernel.org>; Tue, 20 Jan 2026 03:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768906844; x=1769511644; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uckr27RLbm3h8w/yqL5p6ZXMdJeaPZyAz9adDw0oykc=;
        b=BOLNDHGT/oeNo40b07d5HdY+TYQhdqvVgMahw9T1OOQ8GJwn1pLfPkykp2H/IiHDTw
         INjiPWLzzFUFDG6kYc2WjdynBAArhDLQUKVNL9rFfbGufam5BXwrHF2rCh/c0W/6MiKu
         +DhhPXvQ/07wnllXNqpoDJL01mu7T0F62J8+lnW92FjOJI8q1uwSr2fR9d7rJAQbaXgy
         EPjNO2vXohzhpTv49FEQv/sR0NLCt+naUPxodNuHlp8BZGIxB5tGGyMguP8nZjVhV/Qc
         AOqI3tX0iSCpxIglUmqf6WIhfSOlt2/PZzt8cSWgM9KV6kNaLdNqFYgFRcnRPa1T9Wp/
         fdKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768906844; x=1769511644;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uckr27RLbm3h8w/yqL5p6ZXMdJeaPZyAz9adDw0oykc=;
        b=ChkEP2uOnEPK0cWhNjakzfu3MQmGIqzB7GbsHkNMJoJgVSx76sO7H3r5h9fnklqQuk
         VGd1pUHcISiRI7+LpEodOve72i65XjUB9+I2UzNK6w2uKEdK+5xZhr2x58IUR5+s/Bj6
         t9ZfmQr5j4Cnjfqg4rrbzylaCIbUJ5c+i9yEfF402jBL1QfxNGE7MyTJNv0ieCT0C05l
         yGwp/maKjqOEQK2aAQH7yKWW1XpJ69G8ZWbkCvLUoNQU5eovq9W2dtFzlIH1DDI7SzA8
         +SOEmX3nDgvtfw1JrFxQz6gsF+UhA3kUyl+6Baqpr2gIxp8P4PxhmJTRRrC/h0kcyBWc
         YsVg==
X-Forwarded-Encrypted: i=1; AJvYcCX8lY/TeHJFxcFrXGSib8xKb1cdfscctcduLmcvdwWJpGf7eQlqdfncbh82Jr6xDVMQRITIdgPyWBLrUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrI2y1X/+2N7LmBurHqj5d8fT1yfQh9IPkuNEYJhux/apGtGY9
	V5Y0jpuwB/M09JsW5flnns2o3XkH+eSw+/K0jsoAjjXgpKMdXRjGXFlHVwbkfaTpeaZfOt90q73
	lO9BeLZmFS0RzBTAsQj9F3n77QT3MjGEFTVF1kcCIJOkvxRFw2xHbunVTmGNqr3XKEw==
X-Gm-Gg: AY/fxX7DvTMpYcMqNqCjKBNSG8fJJ/UVOzXnDP9Jdm5sExdw+DkrvGmPNBcHf+xZTWR
	21dPX9c/z7FlDKO+KYiWddZ17YzNOkbEsG37AvK5bA5+6GkbRbJMiL+d0Eg9hVN+ocl2dMqCM+3
	/C411VMjROohwllZj3kDSre17cBhRRabl49/sx8MVgew4wqvQG8sEgRH5YxP0vSMXEA1eNKN4n6
	zImJBJftiYK0S/D4K0OccWhLl0Se4+OqRzkf8OkWIa/6ce3TU9gXvYdSyj4MmH+K5hbwi1pDypA
	vjr3XxYcSW+LdF5i9cTkGv6zncS6hwSGgN2AC1G9p9xMKn/BB6HxXvrWUqJzylhrXaxrzI4gkrA
	jv18BOy7HTYlF+32ewTTtOBwgLT8FHamSN7AvcCvfXZbXEKFskyRWriqXmiYU5yw3zoE=
X-Received: by 2002:a05:620a:1911:b0:8a3:d644:6930 with SMTP id af79cd13be357-8c6a6716bedmr1505530985a.5.1768906843314;
        Tue, 20 Jan 2026 03:00:43 -0800 (PST)
X-Received: by 2002:a05:620a:1911:b0:8a3:d644:6930 with SMTP id af79cd13be357-8c6a6716bedmr1505522385a.5.1768906842492;
        Tue, 20 Jan 2026 03:00:42 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a2f1a3sm1348490166b.62.2026.01.20.03.00.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 03:00:42 -0800 (PST)
Message-ID: <c37e9121-31df-4934-9568-9f7e9c9698f3@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 12:00:39 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/5] arm64: dts: qcom: sdm670-google-sargo: add imx355
 front camera
To: Richard Acayan <mailingradian@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
References: <20260117040657.27043-1-mailingradian@gmail.com>
 <20260117040657.27043-6-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260117040657.27043-6-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NtncssdJ c=1 sm=1 tr=0 ts=696f605c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QX4gbG5DAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=He3dl_zFzQSlanp4l3sA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=AbAUZ8qAyYyZVLSsDulk:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 8URT7OLxZgERuujKMsNYUKQ9Ch-OxXtD
X-Proofpoint-ORIG-GUID: 8URT7OLxZgERuujKMsNYUKQ9Ch-OxXtD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA5MSBTYWx0ZWRfX6iXbFmalQDA/
 DK3Ovr7YVQk0mA6Oyvypz4u9/wP3doUBXu8K6d1YOTyNcd+KVbgyfA9M3FZT0/VNnos6uFbJlcm
 9nVXGmBpxwE5VhvbCJmEKndGj+enBfnaqFtGC0Rt8zr2xqeYgMW/f4h8NpN0nHUo1SSO9JsOhb9
 LDdarvfioD3VqlTl0+dVNZ5W9gv7s0J707epIKhLwSMGZtybd/pTq4qf1DlrBNnq0f0R00+9VF6
 1mvoMu+XI93HtahzeHVdTZB/v7gW6nfr9XZBHjoGTGhmQwuHgGYFwZiMEBpFzPzBd+5bFceHAZL
 a80UeSDBiRFZOwf9lGrWvR9VSUAqynrsTSzB56X1dh5wCErpclbohUB9aCVKKFb+1JKd/KReHxP
 MNenEV19vTCE0FGQtmo8KCP5ZmJhLeqqn7Px7qO7g9K+hTXMx+yXgQKmnLB6sCdO1Jlj5uOMrm6
 2QYiwSduBQBZPa4n74w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200091

On 1/17/26 5:06 AM, Richard Acayan wrote:
> The Sony IMX355 is the front camera on the Pixel 3a, mounted in portrait
> mode. It is connected to CSIPHY1 and CCI I2C1, and uses MCLK2. Add
> support for it.
> 
> Co-developed-by: Robert Mader <robert.mader@collabora.com>
> Signed-off-by: Robert Mader <robert.mader@collabora.com>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

[...]

> +&cci_i2c1 {
> +	camera@1a {
> +		compatible = "sony,imx355";
> +		reg = <0x1a>;
> +
> +		clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +
> +		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +		assigned-clock-rates = <19200000>;
> +
> +		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
> +
> +		avdd-supply = <&cam_front_ldo>;
> +		dvdd-supply = <&cam_front_ldo>;
> +		dovdd-supply = <&cam_vio_ldo>;
> +
> +		pinctrl-0 = <&cam_mclk2_default>;

Ideally the reset GPIO could have its config defined too

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

