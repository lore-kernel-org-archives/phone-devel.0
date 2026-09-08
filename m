Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7333812ED
	for <phone-devel@vger.kernel.org>; Tue,  8 Sep 2026 07:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851809; cv=none; b=gTgsNiSUcoaYKK0wWbfAlbbkhN2ytLtvCVHhFUVBHiTWieX714xsJkngBwa7GhG88NcroxCBupnEZZPgXAkdAxKojxGwpFM/rgY4Zrm1UGzOp0KZKXVDcn7/Fcag0yDQ1Ye/ypm/Em9Pmx1p5qQ85L4130slSC26ukc5ql4yGRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851809; c=relaxed/simple;
	bh=K+hdO8YwXvoHzemyeTOvyXNZZ9I8D6Bcyg+siZx5aqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hzY1e+KndC8JiKtGZ1HW/EAlTolSnChwOigOQRY5zRP7WpYEq6c+B12GOY/hIWachNcAWeZpW9pCj60ghDRr5Shb60PxWdCB4K/QmD/6pnlmy50qL7cfhGOpJH43lz+f8JDG/T6NMYB0BfnU36PRNp+hDTJZH1+blWnyjlpGZQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e1+wkkgi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eHjzZ6we; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e1+wkkgi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eHjzZ6we"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886LjKe2172623
	for <phone-devel@vger.kernel.org>; Tue, 8 Sep 2026 07:16:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q2Waas48tG26JkySLVN0ajTL
	Dsc6klnVI0Z2H492f5I=; b=e1+wkkgi3gpSEkCQ2/2tzYO3A4cRJ/mqHshaMCph
	R9LQlsu4y5f2aNbo+AsckJWWRT++vmg9PnM64cfq9Q5wroKDZPaN/wKBlXa2rT/6
	FhY72oBCHb67q7p/SexSuE1xFARj6VTO5EQY9eHhXHN2vbYc0Mlzq7EBMud5SyFA
	sHB8tNkiJMcE8ELkKElq2snXDFL5lMQkOuFeZuqg3M1XNWmyoYZVjXf17mepxHQ3
	RS46/NxRpdeiYaNeTv2CEFlmSF0GLxUwS4rwJ52hIH1mBvuZlcFob3AfmXdGVCaI
	YiNNuHYf/pxAgMyFflPn+wwAAWruSJZtPTpS8+87UoYmwg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj1rrj72q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 08 Sep 2026 07:16:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e5e38fbc5so709187385a.2
        for <phone-devel@vger.kernel.org>; Tue, 08 Sep 2026 00:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788851806; x=1789456606; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q2Waas48tG26JkySLVN0ajTLDsc6klnVI0Z2H492f5I=;
        b=eHjzZ6we2/6gJhe2NEIMhmMSeFruTF+2PkUj7/JQJRJgMtQaQyiI4VxMK6QYdLmqS/
         2nJJQYW+FpXe1Y2nncBmUwxEcJlfQyUjJ5Eno03UFd+qGzDjpVRwVfleF4/iMYg/l/Y9
         0sv+MNbZvTKbKN+W7bBxczUKVMNuGKUPpa1mxj6QXZyCxkTurBiLRoi1G5DBPq1yauBM
         FxxVqc+GRvD0NFTQwvbxgrHtYmg8voWnwJTE3uOsLsyDJ5+wswhrpgdcOlgMtiLgtMjf
         WPszBqid+YCU1pSUcC4dfg6/Knf/9gS1FosG8LyAt49otHAXPy3s58GG8UDM7ZP1begk
         BZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788851806; x=1789456606;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q2Waas48tG26JkySLVN0ajTLDsc6klnVI0Z2H492f5I=;
        b=RkeXe8M4oRVaKqcwOyjRUzbSrBa4+Xu7T1FH8sJhuxNMdJ43YkUTrr4R6+AZ9lAxc0
         slGfEINu1iFhhhDCUcFm5Y6sWGslS1l1qxcogBOeC7bKjerQyQWfuLuBK0rcYX+qypWH
         F76lb70M0nN80/mcwCgSKc5WKC20IbmDqNZGHgFvoZjes2o1Xo5/ZdQ2lNKtFJMUfmwg
         kdUecWbi0h3W8y8xGd5K+yDztdNDDXBcqgFAQRSUYx58WfC7tTujS/9ymOVvUhYe6nqo
         d0tgnqSkot/o8K3sqkl+I8DzW6a1fsT4wUplMnzEoXhenvcDmfWI4E6cw7T+xua2TAkw
         3FoQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhhjV3EZleZBcovFCQFjJY5rQE+oj0KGfD2Z9JbIiYXwEmNM2ZHkCtKsc4IQoTZDuIG9bWndQKgF3meg==@vger.kernel.org
X-Gm-Message-State: AFuF++mP4e30ZLCXyS8sy25pHdClYxsx6V+s6j+MYKIXQ5CI2C1YKQTO
	yTV/6T9BgFWI8aL5YHixylcU8U3zc4ObGkvx9mRAOjd++cO30IDyW4aXHabVkpm7GXGHhHV2uBB
	B7LNfGq6jwjA1WBY5jI5nPytDfQEPxJbdWI3+S2mw8+ZCH9MSGyGg51PQ+eCKW+FRDA==
X-Gm-Gg: AYBFou2/V9vV1xitQV4jomT86un13kP147MGRsVH/VQRItZzRG7Btro6exNMsZnABTL
	mPU26Fd3/uFN0oRJDAKvNB430Yx0o7mBEITIj6skmctC3eHkn8qxSDaVyjPLtsFEkmOluayp1r5
	T/pA4nSU6rSBv9zJh/u/zyHJJT+4yH7RouLH3MgjfI4ZBLBMCrIk/Ct1OiVKTmDUDw58ZXbGHUq
	MX1cL2TJhZZ3LG0qP8r5tXXKSi9n2FXkH8ZcrZjCSISM98StQvTh2Mn3B5UY/sQhNdzMEuLBaNK
	/wlGNp8hC4j2eMQ/sLX+lv3Az7yoBR6aAp1AKm4L125PJ3iOccwstaPyfs17iGJ1px1f4c2chWP
	m3cPhsOetUDg=
X-Received: by 2002:a05:620a:6494:b0:939:7b8f:f244 with SMTP id af79cd13be357-93980379a06mr3025284885a.14.1788851806183;
        Tue, 08 Sep 2026 00:16:46 -0700 (PDT)
X-Received: by 2002:a05:620a:6494:b0:939:7b8f:f244 with SMTP id af79cd13be357-93980379a06mr3025278685a.14.1788851805448;
        Tue, 08 Sep 2026 00:16:45 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d057f4778sm268894755e9.8.2026.09.08.00.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:16:44 -0700 (PDT)
Date: Tue, 8 Sep 2026 10:16:42 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Petr Hodina <petr.hodina@protonmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v9 2/2] arm64: dts: qcom: sdm845-google: Enable PMI8998
 camera flash LEDs
Message-ID: <sfdujw5phslyh4mornf4gii3tmlri64vrzh3atf3gar724dnmb@b7gwv6npuor7>
References: <20260907-pixel3-camera-v9-0-b1981f2d3291@ixit.cz>
 <20260907-pixel3-camera-v9-2-b1981f2d3291@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-pixel3-camera-v9-2-b1981f2d3291@ixit.cz>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3NCBTYWx0ZWRfX/XS4/B/VQVRw
 BLQ1Jqib2eh58ZJ82SschKxsOsqVOnHJnf6BCpqWKlqM2dp28Vdc9IH99mT58MlAljemxzZAXy5
 3c3Z4VB5fE5WsTDB2WtG/bOhthBveaw=
X-Proofpoint-GUID: O4lEQYT4TY5utIdrMVTK6rF1H8VafL5I
X-Authority-Analysis: v=2.4 cv=NsjhtcdJ c=1 sm=1 tr=0 ts=6a9fb65f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=TWkwOYXMJnNHLyErFSkA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3NCBTYWx0ZWRfXy64lzF1fz+IB
 feH4Mzj3mXVM17gLVwtTKrwuUhUNpTNXI/xCAYeZszXlGOK1WcDbXOTT9dLxwCHpLeFoIJhWzmw
 6n2LIURFzIzPA9EuEA7VqCrDREScUMw/EB2FzDHSDrE9A05pbM9fottTpfMfrarf5Tr7GdAimxI
 UPZh0SHGIlggbAHcj2Q6cENGdQdkKKvr1ehRy6OvU+wh/VXgyAt59z/OT956F/Pfu5E967EagnS
 zJ9JMp1TS+5cUiMhFtMIKtAiPZdKqKF0SUzdMQxlaR9F2TDPxGD6nxM1xCZIa4LzeQgGsTof4H7
 WAICj69AJftKPEi6bYuU0gxq9PsgZk8uKNRU30Da0ODQ3mWF5kghzj6P55/hSWnvqVBDN166cZa
 tvFG2jwGdHjz0sc39VIQNJFM6IB2yhniHr7ml+0Rs/CPZsqdjGqTVlB8foadA5YUYWOgHXfZk87
 WG6upT9IhN5vAwf1BNw==
X-Proofpoint-ORIG-GUID: O4lEQYT4TY5utIdrMVTK6rF1H8VafL5I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080074

On 26-09-07 17:58:10, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Enable the PMI8998 flash LED block and describe two white flash LEDs
> used for the rear camera.
> 
> Configure the LED in flash mode with hardware limits matching the
> original device configuration, including maximum current and timeout.
> 
> In contrary to downstream, we can control both LEDs separately.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
