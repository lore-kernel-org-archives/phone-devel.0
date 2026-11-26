Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.225.85
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795674618;
	b=WcriAjByqE9kXNJ3Y8REIbfcMt7+wgCdYGbFjoeSj9hnvO0A8MsQmHvoAU/PYGFzmbbv
	 rzlI/DgQhHQG8fd2woyqnOSuZzkM6n3W0a02D/WZ59y+FT4ShHY1s4s9YplLPYhVPZyM9
	 XtrJdk96NU3Dli5NPF1V8Dx2RakViPEm4H6LPas7J39/3e88U4N/9rRYMKGPNBLInNOzL
	 exSmy/LzKSob5tNM3saEHjPF7d0DPxDeSidTi/+K5HB4NUw3mtZcNuSfl7h0HSdY6ZDne
	 3eO+7KVZK5eIFUzCZpD1k20o7cQNEk7ndQCaIyu1srYrKcfXBsvLKaX+FculnF0LBbw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674618;
	h=DMARC-Filter:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:msip_labels:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=4w1JkOSRJMWGFd5evwH3XNibo4vYKpHjllR5jx9au6Q=;
	b=2cLt/w2+mg7x/+czmqu8995vyZ/gRvDXrGu2cewahA+VOedZHDisMuihDepEmg24r2HO
	 yRVgCLHAxbWoksnI7OW7SU866rsh4cu5mkOM2XbnG1Iyisu8pnoIvI8stOdvl3FdSdzcl
	 BICbntGrVoKsn5Sl3Iq2Ci+PIF/Jm4Cim2drtp1YYFlcED2Vt1fC7L20QatpJB2gHm5ZC
	 hSpSasPtralm0JxAPtDV3mKEYRuucOp2dtYlVtK+8X0rCN2fJFfZEKnO7cjU5wu8hz8q7
	 Gb1Hg7RSOgQKVMmM9M92P6EGm+IN42MzUqDcg6qqddd31IEvZRYjcfLhvWewL732nyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.225.85
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020085.outbound.protection.outlook.com [52.101.225.85])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA575606A32E;
	Thu, 26 Nov 2026 06:30:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA575606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aqtQt+ZC/4l1HGighM7T+fX+sAe4oUGfAoteIDGoxk4tRZ5/TJYrQCzkuNKAjwqbkn9lNy3B2imNwlXEYWIuVh9wXBr5pv20JB5lxb2r0AcLq40TyaI38Fv4XlU2zXooYR9nhYwVEENu7Wc1tcWyDtJEn80Bcy6etCIkRSlx0ZOnqdnHbMVZF1j5RbgZLcLWMZi8Qn9a6n78WODCv1bc3C1GN42sz8jMbqWDQTMisy586cdUn4gsbn9Qu0Vk/njLrx9NxrHpdEf3uMCgz/ym5YO3yQFz0urIzQmjI8NXyRfERoE3zyzrOQ6unoqH5CRW0+uBskja1mEBa4Oocf1gzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4w1JkOSRJMWGFd5evwH3XNibo4vYKpHjllR5jx9au6Q=;
 b=rsi5n/Q6cUEsY8WK/LbIaQNqCy7HlxJTJnk2P5CjLhuA/QX5rblJwJ0Xs+5qdojGyySw0UC/O1Qdb9S8/+x0mWwqqK+6z0EcTf+69jQx8Es4Djkqx/Oqdi4xBKtM5HyEjvUUd1NgxYdf26RWXExSccJ9O+PWxLqFI84lkwz3HiZ/YeNcXTP0f4H/9dqq18E/T3a9PFc7EwVAAWD1DaKr3P3j37WReErascQUODR141eixGfnqUweMNXx92jnkP7SWafM5yhPvkwk6WFqlBjsXX+ddFZ9+/ZmvJKr7K/xhYtOrFn+KBz3mSqE7g6Cv/vUaEkG/4SJYp7ZF5Sr6N+n6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11e::14)
 by PN6P287MB5102.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:302::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 06:30:12 +0000
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167]) by MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167%4]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 06:30:12 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, "armandas.kvietkus@proton.me"
	<armandas.kvietkus@proton.me>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"phone-devel@vger.kernel.org" <phone-devel@vger.kernel.org>
Subject: Re: [PATCH v6 2/2] media: i2c: Add Samsung S5K3T2 image sensor driver
Thread-Topic: [PATCH v6 2/2] media: i2c: Add Samsung S5K3T2 image sensor
 driver
Thread-Index: AQHdeRmaAh43zufXV0CHa41A/88xvLc/7CEc
Date: Thu, 26 Nov 2026 06:30:12 +0000
Message-ID:
 <MA0P287MB2178E1AA2C70AE149191006788422@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
References: <20261120-upstream-s5k3t2-v6-0-dd345fa4201c@proton.me>
 <20261120-upstream-s5k3t2-v6-2-dd345fa4201c@proton.me>
In-Reply-To: <20261120-upstream-s5k3t2-v6-2-dd345fa4201c@proton.me>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB2178:EE_|PN6P287MB5102:EE_
x-ms-office365-filtering-correlation-id: eca09f13-de25-4aa0-eb34-08df4b86b9b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|261022105027099003|261022075727099003|38070700021|10067099003|56012099006|261026140227099003|261026121527099003|261022115727099003|261028144727099003|261021123027099003|261021121427099003|261102123227099003|261009221727099003|261009223027099003|261009223327099003|261009220027099003|261009221227099003|22082099003|18002099003|4143699003|6133799003;
x-microsoft-antispam-message-info:
 0zYFahXV7bkDJz2oV3ukeKF+6UWIqRxkPmP1juZmXBriDwWTYeN5Re1cbPuc+VtdTi3TWhS8Coo9yiBIKSv51V/O0g3/HntR2ubjxwd7R3zHmpL3vC6CCcVHrNmweO1bAalYvkknRGerwh13k2yXmNfLeN6SlkQjY+XffRgUkkRJ6JPfpDK7gnzv0vk7eEpk1ZFthqWesv3rZMj5muSjp9DxIMhHhhrqx/cv3gTitu1L+mmapCNEDVi+k3ZshEaqbRISxJzsbYuS13h223FkiKNN4RPuwzy9H0hj1oveuCs0iF/xvJFU1qjUVRfWuRSbka/drMypBG5YBZjkNfpjcOxmAcQ3M3K4W7wvm2rPJX+JE/jKeQiDC+7/SbxWi+mpNJUQLxCCdsQcmCmIpRmv9o+HP9bKU9s2WYOTwpKcJB3WbyP+8nULRWY0JebRpcTCvaL2WfcWnEE5B6F3utuUDL0LpnFduOnHHxn1CcMrapbgyoaAifMyYoHozHUXabfU+4v8xLGfFkO9BNqtyF1QQs2NdPAgYqx47sJezHz7iYttA6tKtzc06v5+F4MxqAE0DcP6bXWx177cLAKIBYu76u4+sEwyeN0OOD9dRGCM6qvroPAy2f8EZZ1z8MKe6+ztTfqj3LeFWvmJlINozG1NoXsOOs0hPhJZt5rC5//WtyZ8axtgzAObBg2sx9ntLZ7iNNBYi598tNj6TSXgfhxmnFDF5Bgv9z+lg91artekbtU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB2178.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(261022105027099003)(261022075727099003)(38070700021)(10067099003)(56012099006)(261026140227099003)(261026121527099003)(261022115727099003)(261028144727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009221727099003)(261009223027099003)(261009223327099003)(261009220027099003)(261009221227099003)(22082099003)(18002099003)(4143699003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?q0dMVf0yfLqJw8cQ6OQ/H5mLtSVRC9EXFOK/2WiV7d4ANwA99LK4eSL17K?=
 =?iso-8859-1?Q?etaFzBw6I0uKknh0WT4QCXMOIAjdxWPaz/J9ahD8rNiifVt7Kw1yRjBjyJ?=
 =?iso-8859-1?Q?13N7xfH/lzixs7M7Tzj9zOfDSc8VMUG2d6YM1lubNJLr8iAVTvBfEUtyZr?=
 =?iso-8859-1?Q?NrUvt0hVsX7aHCabUSjziD4URkcCRKahdFzXgptFTi4eFoOBnlTY9V4SIF?=
 =?iso-8859-1?Q?9pFtjuhb0A5GIX5mGkn0KoB8Eir3qTg9DesOeFt8JgBoIphcLHsm+olxTP?=
 =?iso-8859-1?Q?FmoWqzVQ6d+Tm9CwAIck8N4udaIn2sR9ZyGiYAmh4Bvadp5+ZAzYXM1k8B?=
 =?iso-8859-1?Q?RX+BeN5HIQQ/JF+22BCvFSkaUPPYTGynLTOjnY8qflp5s5kfM9AoUYggkF?=
 =?iso-8859-1?Q?A3qwJclLqFSmoW7k2FTNnAUh9CWub6eT3l1/WweEORCbcBYMVsrykxDZVR?=
 =?iso-8859-1?Q?2XAgfxj6GBUgPUQS5FVgjdWQ8V14pQtS9CN0fhERzI85WcpsOdX0Jos9SM?=
 =?iso-8859-1?Q?czMl9rcT3H9Loij+qsMvX2+1z653bH5wwPNl/jvuMiU8DT5Mu3uWrTAjoN?=
 =?iso-8859-1?Q?oOAjQ8Q5/LeLxV6nXOU/DUK+hCFjwRSoiV6oW7lP2zg9uRz1kpzipA1kw6?=
 =?iso-8859-1?Q?C1u3Oua2LT+dXVAwfdg6hqMP9RaujsH6j4H8tcgSDnJnB3l1bIPokcaZEc?=
 =?iso-8859-1?Q?bv/KsDf/rXdN5ooLe0uzmu2t1ojB7CmBQiKo3LuS7UZaRkAiaCuJrALupm?=
 =?iso-8859-1?Q?wqzg80q3HAcLDcUVMJ4B0BeOOWsV8ldb+DtOCpr2RvbIp7dDQZq2QuHhzI?=
 =?iso-8859-1?Q?Mbrgp9aWw8/6RSyufxxkKBpXiC8UCKzyhzST9NJvkNbQGc8vTsIJvDzfBP?=
 =?iso-8859-1?Q?qw/XuMyV/MfZXY+GxbseOSEm076xsObMKtL+9xJKs9LvVcEj4+P2rGcmGi?=
 =?iso-8859-1?Q?6CHmluMDocs1MqOqpExZJgu+5C/4JOcHeTjilFtWU6kzf37MSCedh+gU6p?=
 =?iso-8859-1?Q?zX+wonKI+bbv+iFvyiLTdTIPABDW90xgtZPmyZlbnvXBW0wjrl6EoISBae?=
 =?iso-8859-1?Q?P1JbImkjvvy16FxjtWBWX69GwOCNhYIlnM4RcXBxa2y0pLkAmrcj2daJ4t?=
 =?iso-8859-1?Q?JshG7GtsmXnDTuA5sP/Hc5mEDmMHQxDum1cPQsUrX/t/ue8DdwmHDNEky6?=
 =?iso-8859-1?Q?icIgnSvQ6MQAblUjFvZGNhybTvnxxTVbJWiPPx1NawmQ7CnDmO/Lv6aGrd?=
 =?iso-8859-1?Q?2QWuam8rnTF7sVQ3braGQ+TU2M5nIKZ8LxUgcUaIZDXcUp1kXNGanqSDFY?=
 =?iso-8859-1?Q?oiQVNv9eBG2bWr2zgiWspRF8cf9i42DsT45z+97BcQpbewj8kZtPNL5nUs?=
 =?iso-8859-1?Q?PVRw+DpgFhc4cnT8JmMSAAte1H283R9myXzHXBA3PkMfxEcc5o9EfFMTSy?=
 =?iso-8859-1?Q?WzQclLUcmbd7MW4QgixQPi29+FjT1XPKPpNMrlc/nQL02OwAgFsAB1LweH?=
 =?iso-8859-1?Q?vEXsuSI1DlTA9YcHiA4GGILI85YUcvTi0qXvjyLTiAWhkcKiS2tuDTRlZG?=
 =?iso-8859-1?Q?OEAs1z/1Q4iI6opSZUl7HRG9M/wfsuPrKQsTFKXICH1Bhr33VAH+7xU9El?=
 =?iso-8859-1?Q?llImii/tnOK75VxwoaKc0qjV/a+waqftFucTiK3SdXjSH0FLQviu3Swtqu?=
 =?iso-8859-1?Q?6mZiWu/2tji2BEsrZs/26cqoeiwqZtMFi7USPBgY1hGpuy6DiGcktl3qqO?=
 =?iso-8859-1?Q?urDtgbJCbEpLrGuPd3SE1UbU9PiiZXky6nRjz/yy1z9MBJfBv7LeIhiSTX?=
 =?iso-8859-1?Q?6fKqqVvRYSb2hKN5an9Xz+CXxfWo/YM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: eca09f13-de25-4aa0-eb34-08df4b86b9b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2026 06:30:12.2511
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mDGVCy3MYR8y7nnGFhhkeO26AN0A+ZZ/oK7Ub9MjyR3ZrII+aPcwyqNbvWBngrf4Kkd75WIqK8cm8gG6JdVBMTKK8aDmpG33IOhDyA4MJZGUOdmOLSPnA4lCsXfi63GE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN6P287MB5102

Hi Armandas, Sakari,=0A=
=0A=
Sorry, I missed this point earlier.=0A=
=0A=
>+// SPDX-License-Identifier: GPL-2.0=0A=
>+// Copyright (c) 2026 Armandas Kvietkus <armandas.kvietkus@proton.me>=0A=
>+=0A=
>+#include <linux/clk.h>=0A=
>+#include <linux/delay.h>=0A=
>+#include <linux/gpio/consumer.h>=0A=
>+#include <linux/i2c.h>=0A=
>+#include <linux/module.h>=0A=
>+#include <linux/pm_runtime.h>=0A=
>+#include <linux/regulator/consumer.h>=0A=
>+#include <linux/units.h>=0A=
>+#include <media/v4l2-cci.h>=0A=
>+#include <media/v4l2-ctrls.h>=0A=
>+#include <media/v4l2-device.h>=0A=
>+#include <media/v4l2-fwnode.h>=0A=
>+=0A=
>+#define S5K3T2_LINK_FREQ_448MHZ		(448 * HZ_PER_MHZ)=0A=
>+#define S5K3T2_LINK_FREQ_300MHZ		(300 * HZ_PER_MHZ)=0A=
>+#define S5K3T2_MCLK_FREQ		19200000=0A=
>+#define S5K3T2_PIXEL_RATE		676571429=0A=
>+#define S5K3T2_DATA_LANES		4=0A=
>+=0A=
>+#define S5K3T2_REG_CHIP_ID		CCI_REG16(0x0000)=0A=
>+#define S5K3T2_CHIP_ID			0x3142=0A=
>+=0A=
>+#define S5K3T2_REG_MODE_SELECT		CCI_REG8(0x0100)=0A=
>+#define S5K3T2_MODE_STANDBY		0x00=0A=
>+#define S5K3T2_MODE_STREAMING		0x01=0A=
>+=0A=
>+#define S5K3T2_REG_ORIENTATION		CCI_REG8(0x0101)=0A=
>+#define S5K3T2_VFLIP			BIT(1)=0A=
>+#define S5K3T2_HFLIP			BIT(0)=0A=
>+=0A=
>+#define S5K3T2_REG_EXPOSURE		CCI_REG16(0x0202)=0A=
>+#define S5K3T2_EXPOSURE_MIN		8=0A=
>+#define S5K3T2_EXPOSURE_STEP		1=0A=
>+#define S5K3T2_EXPOSURE_MARGIN		4=0A=
>+=0A=
>+#define S5K3T2_REG_AGAIN		CCI_REG16(0x0204)=0A=
>+#define S5K3T2_AGAIN_MIN		1=0A=
>+#define S5K3T2_AGAIN_MAX		16=0A=
>+#define S5K3T2_AGAIN_STEP		1=0A=
>+#define S5K3T2_AGAIN_DEFAULT		1=0A=
>+#define S5K3T2_AGAIN_SHIFT		5=0A=
>+=0A=
>+#define S5K3T2_REG_VTS			CCI_REG16(0x0340)=0A=
>+#define S5K3T2_VTS_MAX			0xffff=0A=
>+=0A=
>+#define S5K3T2_REG_HTS			CCI_REG16(0x0342)=0A=
>+=0A=
>+#define S5K3T2_REG_TEST_PATTERN		CCI_REG16(0x0600)=0A=
>+=0A=
>+#define S5K3T2_NATIVE_WIDTH		5192=0A=
>+#define S5K3T2_NATIVE_HEIGHT		3888=0A=
>+=0A=
>+#define S5K3T2_DEFAULT_WIDTH		2592=0A=
>+#define S5K3T2_DEFAULT_HEIGHT		1940=0A=
>+=0A=
>+#define to_s5k3t2(_sd)			container_of_const(_sd, struct s5k3t2, sd)=0A=
>+=0A=
>+static const s64 s5k3t2_link_freq_menu[] =3D {=0A=
>+	S5K3T2_LINK_FREQ_448MHZ,=0A=
>+	S5K3T2_LINK_FREQ_300MHZ,=0A=
>+};=0A=
>+=0A=
>+static const u32 s5k3t2_mbus_formats[] =3D {=0A=
>+	MEDIA_BUS_FMT_SGRBG10_1X10,	MEDIA_BUS_FMT_SRGGB10_1X10,=0A=
>+	MEDIA_BUS_FMT_SBGGR10_1X10,	MEDIA_BUS_FMT_SGBRG10_1X10,=0A=
>+};=0A=
>+=0A=
>+struct s5k3t2_reg_list {=0A=
>+	const struct cci_reg_sequence *regs;=0A=
>+	unsigned int num_regs;=0A=
>+};=0A=
>+=0A=
>+struct s5k3t2_mode {=0A=
>+	u32 width;=0A=
>+	u32 height;=0A=
>+	u32 hts;=0A=
>+	u32 vts;=0A=
>+	u32 exposure;=0A=
>+	unsigned int link_freq_index;=0A=
>+	struct v4l2_rect crop;=0A=
>+	const struct s5k3t2_reg_list reg_list;=0A=
>+};=0A=
>+=0A=
>+static const char * const s5k3t2_test_pattern_menu[] =3D {=0A=
>+	"Disabled",=0A=
>+	"Solid colour",=0A=
>+	"Colour bars",=0A=
>+	"Fade to grey colour bars",=0A=
>+	"PN9",=0A=
>+};=0A=
>+=0A=
>+static const char * const s5k3t2_supply_names[] =3D {=0A=
>+	"vdda",=0A=
>+	"vddd",=0A=
>+	"vddio",=0A=
>+};=0A=
>+=0A=
>+struct s5k3t2 {=0A=
>+	struct device *dev;=0A=
>+	struct regmap *regmap;=0A=
>+	struct clk *mclk;=0A=
>+	struct gpio_desc *reset_gpio;=0A=
>+	struct regulator_bulk_data supplies[ARRAY_SIZE(s5k3t2_supply_names)];=0A=
>+=0A=
>+	struct v4l2_subdev sd;=0A=
>+	struct media_pad pad;=0A=
>+=0A=
>+	struct v4l2_ctrl_handler ctrl_handler;=0A=
>+	struct v4l2_ctrl *link_freq;=0A=
>+	struct v4l2_ctrl *hblank;=0A=
>+	struct v4l2_ctrl *vblank;=0A=
>+	struct v4l2_ctrl *exposure;=0A=
>+	struct v4l2_ctrl *hflip;=0A=
>+	struct v4l2_ctrl *vflip;=0A=
>+=0A=
>+	unsigned long link_freq_bitmap;=0A=
>+};=0A=
>+=0A=
>+static const struct cci_reg_sequence s5k3t2_init_setting[] =3D {=0A=
>+	{ CCI_REG16(0x6214), 0xff7d },=0A=
>+	{ CCI_REG16(0x6218), 0x0000 },=0A=
>+	{ CCI_REG16(0x0a02), 0x003f },=0A=
>+	{ CCI_REG16(0x6028), 0x2000 },=0A=
>+	{ CCI_REG16(0x602a), 0x3aec },=0A=
>+	{ CCI_REG16(0x6f12), 0x0000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0549 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0448 },=0A=
>+	{ CCI_REG16(0x6f12), 0x054a },=0A=
>+	{ CCI_REG16(0x6f12), 0xc1f8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2c05 },=0A=
>+	{ CCI_REG16(0x6f12), 0x101a },=0A=
>+	{ CCI_REG16(0x6f12), 0xa1f8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x3005 },=0A=
>+	{ CCI_REG16(0x6f12), 0x00f0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x7bb8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x3ca0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2670 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x9c00 },=0A=
>+	{ CCI_REG16(0x6f12), 0x70b5 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0646 },=0A=
>+	{ CCI_REG16(0x6f12), 0x4348 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0022 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0168 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0c0c },=0A=
>+	{ CCI_REG16(0x6f12), 0x8db2 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2946 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2046 },=0A=
>+	{ CCI_REG16(0x6f12), 0x00f0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x9bf8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x3046 },=0A=
>+	{ CCI_REG16(0x6f12), 0x00f0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x9df8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x3d48 },=0A=
>+	{ CCI_REG16(0x6f12), 0x3e4a },=0A=
>+	{ CCI_REG16(0x6f12), 0x0830 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0188 },=0A=
>+	{ CCI_REG16(0x6f12), 0x1180 },=0A=
>+	{ CCI_REG16(0x6f12), 0x911c },=0A=
>+	{ CCI_REG16(0x6f12), 0x4088 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0880 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2946 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2046 },=0A=
>+	{ CCI_REG16(0x6f12), 0xbde8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x7040 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0122 },=0A=
>+	{ CCI_REG16(0x6f12), 0x00f0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x89b8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x70b5 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0646 },=0A=
>+	{ CCI_REG16(0x6f12), 0x3548 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0022 },=0A=
>+	{ CCI_REG16(0x6f12), 0x4068 },=0A=
>+	{ CCI_REG16(0x6f12), 0x84b2 },=0A=
>+	{ CCI_REG16(0x6f12), 0x050c },=0A=
>+	{ CCI_REG16(0x6f12), 0x2146 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2846 },=0A=
>+	{ CCI_REG16(0x6f12), 0x00f0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x7ef8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x3046 },=0A=
>+	{ CCI_REG16(0x6f12), 0x00f0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x85f8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x3149 },=0A=
>+	{ CCI_REG16(0x6f12), 0x314b },=0A=
>+	{ CCI_REG16(0x6f12), 0x0120 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0988 },=0A=
>+	{ CCI_REG16(0x6f12), 0x40ea },=0A=
>+	{ CCI_REG16(0x6f12), 0x0110 },=0A=
>+	{ CCI_REG16(0x6f12), 0x5881 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2f48 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0078 },=0A=
>+	{ CCI_REG16(0x6f12), 0x68b1 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0022 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2e48 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2f49 },=0A=
>+	{ CCI_REG16(0x6f12), 0x80f8 },=0A=
>+	{ CCI_REG16(0x6f12), 0xc428 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0a80 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2e49 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0e78 },=0A=
>+	{ CCI_REG16(0x6f12), 0x36b1 },=0A=
>+	{ CCI_REG16(0x6f12), 0x90f8 },=0A=
>+	{ CCI_REG16(0x6f12), 0xe803 },=0A=
>+	{ CCI_REG16(0x6f12), 0x18b1 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0120 },=0A=
>+	{ CCI_REG16(0x6f12), 0x02e0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0122 },=0A=
>+	{ CCI_REG16(0x6f12), 0xf0e7 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0020 },=0A=
>+	{ CCI_REG16(0x6f12), 0x4978 },=0A=
>+	{ CCI_REG16(0x6f12), 0x01b1 },=0A=
>+	{ CCI_REG16(0x6f12), 0x42b1 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0021 },=0A=
>+	{ CCI_REG16(0x6f12), 0x40ea },=0A=
>+	{ CCI_REG16(0x6f12), 0x0110 },=0A=
>+	{ CCI_REG16(0x6f12), 0x5880 },=0A=
>+	{ CCI_REG16(0x6f12), 0x00f0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x66f8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0128 },=0A=
>+	{ CCI_REG16(0x6f12), 0x02d0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x1be0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0121 },=0A=
>+	{ CCI_REG16(0x6f12), 0xf5e7 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2248 },=0A=
>+	{ CCI_REG16(0x6f12), 0x234a },=0A=
>+	{ CCI_REG16(0x6f12), 0x234e },=0A=
>+	{ CCI_REG16(0x6f12), 0xb0f8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x7211 },=0A=
>+	{ CCI_REG16(0x6f12), 0x92f8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x9420 },=0A=
>+	{ CCI_REG16(0x6f12), 0x90f8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x7401 },=0A=
>+	{ CCI_REG16(0x6f12), 0xd140 },=0A=
>+	{ CCI_REG16(0x6f12), 0xd040 },=0A=
>+	{ CCI_REG16(0x6f12), 0x4318 },=0A=
>+	{ CCI_REG16(0x6f12), 0x96f8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x7f63 },=0A=
>+	{ CCI_REG16(0x6f12), 0x581e },=0A=
>+	{ CCI_REG16(0x6f12), 0x022e },=0A=
>+	{ CCI_REG16(0x6f12), 0x03d9 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0220 },=0A=
>+	{ CCI_REG16(0x6f12), 0x9040 },=0A=
>+	{ CCI_REG16(0x6f12), 0x181a },=0A=
>+	{ CCI_REG16(0x6f12), 0x401c },=0A=
>+	{ CCI_REG16(0x6f12), 0x164a },=0A=
>+	{ CCI_REG16(0x6f12), 0x703a },=0A=
>+	{ CCI_REG16(0x6f12), 0x1180 },=0A=
>+	{ CCI_REG16(0x6f12), 0x911c },=0A=
>+	{ CCI_REG16(0x6f12), 0x0880 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2146 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2846 },=0A=
>+	{ CCI_REG16(0x6f12), 0xbde8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x7040 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0122 },=0A=
>+	{ CCI_REG16(0x6f12), 0x00f0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x31b8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x10b5 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0022 },=0A=
>+	{ CCI_REG16(0x6f12), 0xaff2 },=0A=
>+	{ CCI_REG16(0x6f12), 0xb501 },=0A=
>+	{ CCI_REG16(0x6f12), 0x1348 },=0A=
>+	{ CCI_REG16(0x6f12), 0x00f0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x3ef8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x064c },=0A=
>+	{ CCI_REG16(0x6f12), 0x0022 },=0A=
>+	{ CCI_REG16(0x6f12), 0xaff2 },=0A=
>+	{ CCI_REG16(0x6f12), 0xff01 },=0A=
>+	{ CCI_REG16(0x6f12), 0x6060 },=0A=
>+	{ CCI_REG16(0x6f12), 0x1048 },=0A=
>+	{ CCI_REG16(0x6f12), 0x00f0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x36f8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0f49 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2060 },=0A=
>+	{ CCI_REG16(0x6f12), 0x7a20 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0968 },=0A=
>+	{ CCI_REG16(0x6f12), 0x4883 },=0A=
>+	{ CCI_REG16(0x6f12), 0x10bd },=0A=
>+	{ CCI_REG16(0x6f12), 0x2000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x3c90 },=0A=
>+	{ CCI_REG16(0x6f12), 0x4000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x950c },=0A=
>+	{ CCI_REG16(0x6f12), 0x2000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x16f0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x4000 },=0A=
>+	{ CCI_REG16(0x6f12), 0xd000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x19a0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x30c0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x4000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x9800 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x1dd0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x17c0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2210 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2670 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0000 },=0A=
>+	{ CCI_REG16(0x6f12), 0xf45f },=0A=
>+	{ CCI_REG16(0x6f12), 0x0000 },=0A=
>+	{ CCI_REG16(0x6f12), 0xd957 },=0A=
>+	{ CCI_REG16(0x6f12), 0x2000 },=0A=
>+	{ CCI_REG16(0x6f12), 0x08c0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x49f6 },=0A=
>+	{ CCI_REG16(0x6f12), 0x213c },=0A=
>+	{ CCI_REG16(0x6f12), 0xc0f2 },=0A=
>+	{ CCI_REG16(0x6f12), 0x000c },=0A=
>+	{ CCI_REG16(0x6f12), 0x6047 },=0A=
>+	{ CCI_REG16(0x6f12), 0x4df6 },=0A=
>+	{ CCI_REG16(0x6f12), 0x571c },=0A=
>+	{ CCI_REG16(0x6f12), 0xc0f2 },=0A=
>+	{ CCI_REG16(0x6f12), 0x000c },=0A=
>+	{ CCI_REG16(0x6f12), 0x6047 },=0A=
>+	{ CCI_REG16(0x6f12), 0x4ff2 },=0A=
>+	{ CCI_REG16(0x6f12), 0x5f4c },=0A=
>+	{ CCI_REG16(0x6f12), 0xc0f2 },=0A=
>+	{ CCI_REG16(0x6f12), 0x000c },=0A=
>+	{ CCI_REG16(0x6f12), 0x6047 },=0A=
>+	{ CCI_REG16(0x6f12), 0x44f2 },=0A=
>+	{ CCI_REG16(0x6f12), 0x9b0c },=0A=
>+	{ CCI_REG16(0x6f12), 0xc0f2 },=0A=
>+	{ CCI_REG16(0x6f12), 0x000c },=0A=
>+	{ CCI_REG16(0x6f12), 0x6047 },=0A=
>+	{ CCI_REG16(0x6f12), 0x4bf2 },=0A=
>+	{ CCI_REG16(0x6f12), 0xed0c },=0A=
>+	{ CCI_REG16(0x6f12), 0xc0f2 },=0A=
>+	{ CCI_REG16(0x6f12), 0x000c },=0A=
>+	{ CCI_REG16(0x6f12), 0x6047 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0000 },=0A=
>+	{ CCI_REG16(0x602a), 0x1014 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0100 },=0A=
>+	{ CCI_REG16(0x6f12), 0x7000 },=0A=
>+	{ CCI_REG16(0x602a), 0x108a },=0A=
>+	{ CCI_REG16(0x6f12), 0x0006 },=0A=
>+	{ CCI_REG16(0x602a), 0x1092 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0005 },=0A=
>+	{ CCI_REG16(0x602a), 0x1096 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0002 },=0A=
>+	{ CCI_REG16(0x6f12), 0x001a },=0A=
>+	{ CCI_REG16(0x602a), 0x109c },=0A=
>+	{ CCI_REG16(0x6f12), 0x0014 },=0A=
>+	{ CCI_REG16(0x602a), 0x10a2 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0022 },=0A=
>+	{ CCI_REG16(0x602a), 0x10ae },=0A=
>+	{ CCI_REG16(0x6f12), 0x0007 },=0A=
>+	{ CCI_REG16(0x602a), 0x10c2 },=0A=
>+	{ CCI_REG16(0x6f12), 0x001e },=0A=
>+	{ CCI_REG16(0x602a), 0x10f4 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0003 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0003 },=0A=
>+	{ CCI_REG16(0x602a), 0x110a },=0A=
>+	{ CCI_REG16(0x6f12), 0x0000 },=0A=
>+	{ CCI_REG16(0x602a), 0x113e },=0A=
>+	{ CCI_REG16(0x6f12), 0x0001 },=0A=
>+	{ CCI_REG16(0x6f12), 0x014e },=0A=
>+	{ CCI_REG16(0x602a), 0x13ea },=0A=
>+	{ CCI_REG16(0x6f12), 0x160f },=0A=
>+	{ CCI_REG16(0x6f12), 0x0d00 },=0A=
>+	{ CCI_REG16(0x602a), 0x13fa },=0A=
>+	{ CCI_REG16(0x6f12), 0x009d },=0A=
>+	{ CCI_REG16(0x6f12), 0x0107 },=0A=
>+	{ CCI_REG16(0x602a), 0x14e2 },=0A=
>+	{ CCI_REG16(0x6f12), 0x04c2 },=0A=
>+	{ CCI_REG16(0x6f12), 0x02ae },=0A=
>+	{ CCI_REG16(0x6f12), 0x0020 },=0A=
>+	{ CCI_REG16(0x6028), 0x4000 },=0A=
>+	{ CCI_REG16(0xf44a), 0x0010 },=0A=
>+	{ CCI_REG16(0xf46a), 0xb6a0 },=0A=
>+	{ CCI_REG16(0x6028), 0x2000 },=0A=
>+	{ CCI_REG16(0x602a), 0x0f5e },=0A=
>+	{ CCI_REG16(0x6f12), 0x0200 },=0A=
>+	{ CCI_REG16(0x602a), 0x0f90 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0000 },=0A=
>+	{ CCI_REG16(0x602a), 0x17c0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0010 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0201 },=0A=
>+	{ CCI_REG16(0x602a), 0x1da2 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0001 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0203 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0405 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0607 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0809 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0a0b },=0A=
>+	{ CCI_REG16(0x6f12), 0x0c0d },=0A=
>+	{ CCI_REG16(0x6f12), 0x0e0f },=0A=
>+	{ CCI_REG16(0x6028), 0x4000 },=0A=
>+	{ CCI_REG16(0x020c), 0x0001 },=0A=
>+	{ CCI_REG16(0x0bc6), 0x0000 },=0A=
>+	{ CCI_REG16(0x0d00), 0x0000 },=0A=
>+	{ CCI_REG16(0xb13c), 0x0800 },=0A=
>+};=0A=
>+=0A=
>+static const struct cci_reg_sequence s5k3t2_5184x3880_mode[] =3D {=0A=
>+	{ CCI_REG16(0x6028), 0x4000 },=0A=
>+	{ CCI_REG16(0x0136), 0x1300 },=0A=
>+	{ CCI_REG16(0x013e), 0x00c8 },=0A=
>+	{ CCI_REG16(0x0304), 0x0003 },=0A=
>+	{ CCI_REG16(0x0306), 0x00b9 },=0A=
>+	{ CCI_REG16(0x6028), 0x2000 },=0A=
>+	{ CCI_REG16(0x602a), 0x0e0e },=0A=
>+	{ CCI_REG16(0x6f12), 0x0103 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0000 },=0A=
>+	{ CCI_REG16(0x602a), 0x1078 },=0A=
>+	{ CCI_REG16(0x6f12), 0x04a6 },=0A=
>+	{ CCI_REG16(0x6028), 0x4000 },=0A=
>+	{ CCI_REG16(0x030c), 0x0000 },=0A=
>+	{ CCI_REG16(0x0302), 0x0001 },=0A=
>+	{ CCI_REG16(0x0300), 0x0007 },=0A=
>+	{ CCI_REG16(0x030e), 0x0003 },=0A=
>+	{ CCI_REG16(0x0310), 0x008c },=0A=
>+	{ CCI_REG16(0x0312), 0x0001 },=0A=
>+	{ CCI_REG16(0x0308), 0x0008 },=0A=
>+	{ CCI_REG16(0x030a), 0x0001 },=0A=
>+	{ CCI_REG16(0x0344), 0x0008 },=0A=
>+	{ CCI_REG16(0x0346), 0x0008 },=0A=
>+	{ CCI_REG16(0x0348), 0x1447 },=0A=
>+	{ CCI_REG16(0x034a), 0x0f2f },=0A=
>+	{ CCI_REG16(0x034c), 0x1440 },=0A=
>+	{ CCI_REG16(0x034e), 0x0f28 },=0A=
>+	{ CCI_REG16(0x0350), 0x0000 },=0A=
>+	{ CCI_REG16(0x0352), 0x0000 },=0A=
>+	{ CCI_REG16(0x0900), 0x0111 },=0A=
>+	{ CCI_REG16(0x0404), 0x1000 },=0A=
>+	{ CCI_REG16(0x0380), 0x0001 },=0A=
>+	{ CCI_REG16(0x0382), 0x0001 },=0A=
>+	{ CCI_REG16(0x0384), 0x0001 },=0A=
>+	{ CCI_REG16(0x0386), 0x0001 },=0A=
>+	{ CCI_REG16(0x010c), 0x0000 },=0A=
>+	{ CCI_REG16(0x0114), 0x0300 },=0A=
>+	{ CCI_REG16(0x0116), 0x3000 },=0A=
>+	{ CCI_REG16(0x011a), 0x0001 },=0A=
>+	{ CCI_REG16(0x0118), 0x0002 },=0A=
>+	{ CCI_REG16(0x6028), 0x2000 },=0A=
>+	{ CCI_REG16(0x602a), 0x0e92 },=0A=
>+	{ CCI_REG16(0x6f12), 0xffff },=0A=
>+	{ CCI_REG16(0x602a), 0x165a },=0A=
>+	{ CCI_REG16(0x6f12), 0x0003 },=0A=
>+	{ CCI_REG16(0x6028), 0x4000 },=0A=
>+	{ CCI_REG16(0x0b04), 0x0001 },=0A=
>+	{ CCI_REG16(0x0b06), 0x0101 },=0A=
>+	{ CCI_REG16(0x0fea), 0x04a0 },=0A=
>+	{ CCI_REG16(0x6028), 0x2000 },=0A=
>+	{ CCI_REG16(0x602a), 0x3c98 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0a58 },=0A=
>+	{ CCI_REG16(0x6f12), 0x1477 },=0A=
>+	{ CCI_REG16(0x602a), 0x1da0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0010 },=0A=
>+	{ CCI_REG16(0x602a), 0x10ac },=0A=
>+	{ CCI_REG16(0x6f12), 0x000a },=0A=
>+	{ CCI_REG16(0x602a), 0x1110 },=0A=
>+	{ CCI_REG16(0x6f12), 0x001d },=0A=
>+	{ CCI_REG16(0x6f12), 0x003f },=0A=
>+	{ CCI_REG16(0x602a), 0x13e8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0804 },=0A=
>+	{ CCI_REG16(0x602a), 0x13f8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x38c8 },=0A=
>+};=0A=
>+=0A=
>+static const struct cci_reg_sequence s5k3t2_2592x1940_mode[] =3D {=0A=
>+	{ CCI_REG16(0x6028), 0x4000 },=0A=
>+	{ CCI_REG16(0x0136), 0x1300 },=0A=
>+	{ CCI_REG16(0x013e), 0x00c8 },=0A=
>+	{ CCI_REG16(0x0304), 0x0003 },=0A=
>+	{ CCI_REG16(0x0306), 0x00b9 },=0A=
>+	{ CCI_REG16(0x6028), 0x2000 },=0A=
>+	{ CCI_REG16(0x602a), 0x0e0e },=0A=
>+	{ CCI_REG16(0x6f12), 0x0103 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0000 },=0A=
>+	{ CCI_REG16(0x602a), 0x1078 },=0A=
>+	{ CCI_REG16(0x6f12), 0x04a6 },=0A=
>+	{ CCI_REG16(0x6028), 0x4000 },=0A=
>+	{ CCI_REG16(0x030c), 0x0000 },=0A=
>+	{ CCI_REG16(0x0302), 0x0001 },=0A=
>+	{ CCI_REG16(0x0300), 0x0007 },=0A=
>+	{ CCI_REG16(0x030e), 0x0003 },=0A=
>+	{ CCI_REG16(0x0310), 0x008c },=0A=
>+	{ CCI_REG16(0x0312), 0x0001 },=0A=
>+	{ CCI_REG16(0x0308), 0x0008 },=0A=
>+	{ CCI_REG16(0x030a), 0x0001 },=0A=
>+	{ CCI_REG16(0x0344), 0x0008 },=0A=
>+	{ CCI_REG16(0x0346), 0x0008 },=0A=
>+	{ CCI_REG16(0x0348), 0x1447 },=0A=
>+	{ CCI_REG16(0x034a), 0x0f2f },=0A=
>+	{ CCI_REG16(0x034c), 0x0a20 },=0A=
>+	{ CCI_REG16(0x034e), 0x0794 },=0A=
>+	{ CCI_REG16(0x0350), 0x0000 },=0A=
>+	{ CCI_REG16(0x0352), 0x0000 },=0A=
>+	{ CCI_REG16(0x0900), 0x0122 },=0A=
>+	{ CCI_REG16(0x0404), 0x1000 },=0A=
>+	{ CCI_REG16(0x0380), 0x0002 },=0A=
>+	{ CCI_REG16(0x0382), 0x0002 },=0A=
>+	{ CCI_REG16(0x0384), 0x0002 },=0A=
>+	{ CCI_REG16(0x0386), 0x0002 },=0A=
>+	{ CCI_REG16(0x010c), 0x0000 },=0A=
>+	{ CCI_REG16(0x0114), 0x0300 },=0A=
>+	{ CCI_REG16(0x0116), 0x3000 },=0A=
>+	{ CCI_REG16(0x011a), 0x0001 },=0A=
>+	{ CCI_REG16(0x0118), 0x0002 },=0A=
>+	{ CCI_REG16(0x6028), 0x2000 },=0A=
>+	{ CCI_REG16(0x602a), 0x0e92 },=0A=
>+	{ CCI_REG16(0x6f12), 0xffff },=0A=
>+	{ CCI_REG16(0x602a), 0x165a },=0A=
>+	{ CCI_REG16(0x6f12), 0x0003 },=0A=
>+	{ CCI_REG16(0x6028), 0x4000 },=0A=
>+	{ CCI_REG16(0x0b04), 0x0001 },=0A=
>+	{ CCI_REG16(0x0b06), 0x0101 },=0A=
>+	{ CCI_REG16(0x0fea), 0x04a0 },=0A=
>+	{ CCI_REG16(0x6028), 0x2000 },=0A=
>+	{ CCI_REG16(0x602a), 0x3c98 },=0A=
>+	{ CCI_REG16(0x6f12), 0x052c },=0A=
>+	{ CCI_REG16(0x6f12), 0x0a3b },=0A=
>+	{ CCI_REG16(0x602a), 0x1da0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0010 },=0A=
>+	{ CCI_REG16(0x602a), 0x10ac },=0A=
>+	{ CCI_REG16(0x6f12), 0x0014 },=0A=
>+	{ CCI_REG16(0x602a), 0x1110 },=0A=
>+	{ CCI_REG16(0x6f12), 0x001d },=0A=
>+	{ CCI_REG16(0x6f12), 0x004d },=0A=
>+	{ CCI_REG16(0x602a), 0x13e8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x080f },=0A=
>+	{ CCI_REG16(0x602a), 0x13f8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x38c8 },=0A=
>+};=0A=
>+=0A=
>+static const struct cci_reg_sequence s5k3t2_1280x720_mode[] =3D {=0A=
>+	{ CCI_REG16(0x6028), 0x4000 },=0A=
>+	{ CCI_REG16(0x0136), 0x1300 },=0A=
>+	{ CCI_REG16(0x013e), 0x00c8 },=0A=
>+	{ CCI_REG16(0x0304), 0x0003 },=0A=
>+	{ CCI_REG16(0x0306), 0x00b9 },=0A=
>+	{ CCI_REG16(0x6028), 0x2000 },=0A=
>+	{ CCI_REG16(0x602a), 0x0e0e },=0A=
>+	{ CCI_REG16(0x6f12), 0x0104 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0000 },=0A=
>+	{ CCI_REG16(0x602a), 0x1078 },=0A=
>+	{ CCI_REG16(0x6f12), 0x04a6 },=0A=
>+	{ CCI_REG16(0x6028), 0x4000 },=0A=
>+	{ CCI_REG16(0x030c), 0x0000 },=0A=
>+	{ CCI_REG16(0x0302), 0x0001 },=0A=
>+	{ CCI_REG16(0x0300), 0x0007 },=0A=
>+	{ CCI_REG16(0x030e), 0x0002 },=0A=
>+	{ CCI_REG16(0x0310), 0x007d },=0A=
>+	{ CCI_REG16(0x0312), 0x0002 },=0A=
>+	{ CCI_REG16(0x0308), 0x0008 },=0A=
>+	{ CCI_REG16(0x030a), 0x0001 },=0A=
>+	{ CCI_REG16(0x0344), 0x0028 },=0A=
>+	{ CCI_REG16(0x0346), 0x01fc },=0A=
>+	{ CCI_REG16(0x0348), 0x1427 },=0A=
>+	{ CCI_REG16(0x034a), 0x0d3b },=0A=
>+	{ CCI_REG16(0x034c), 0x0500 },=0A=
>+	{ CCI_REG16(0x034e), 0x02d0 },=0A=
>+	{ CCI_REG16(0x0350), 0x0000 },=0A=
>+	{ CCI_REG16(0x0352), 0x0000 },=0A=
>+	{ CCI_REG16(0x0900), 0x0124 },=0A=
>+	{ CCI_REG16(0x0404), 0x2000 },=0A=
>+	{ CCI_REG16(0x0380), 0x0002 },=0A=
>+	{ CCI_REG16(0x0382), 0x0002 },=0A=
>+	{ CCI_REG16(0x0384), 0x0002 },=0A=
>+	{ CCI_REG16(0x0386), 0x0006 },=0A=
>+	{ CCI_REG16(0x010c), 0x0000 },=0A=
>+	{ CCI_REG16(0x0114), 0x0300 },=0A=
>+	{ CCI_REG16(0x0116), 0x3000 },=0A=
>+	{ CCI_REG16(0x011a), 0x0001 },=0A=
>+	{ CCI_REG16(0x0118), 0x0002 },=0A=
>+	{ CCI_REG16(0x6028), 0x2000 },=0A=
>+	{ CCI_REG16(0x602a), 0x0e92 },=0A=
>+	{ CCI_REG16(0x6f12), 0xffff },=0A=
>+	{ CCI_REG16(0x602a), 0x165a },=0A=
>+	{ CCI_REG16(0x6f12), 0x0020 },=0A=
>+	{ CCI_REG16(0x6028), 0x4000 },=0A=
>+	{ CCI_REG16(0x0b04), 0x0001 },=0A=
>+	{ CCI_REG16(0x0b06), 0x0101 },=0A=
>+	{ CCI_REG16(0x0fea), 0x04a0 },=0A=
>+	{ CCI_REG16(0x6028), 0x2000 },=0A=
>+	{ CCI_REG16(0x602a), 0x3c98 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0296 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0515 },=0A=
>+	{ CCI_REG16(0x602a), 0x1da0 },=0A=
>+	{ CCI_REG16(0x6f12), 0x0110 },=0A=
>+	{ CCI_REG16(0x602a), 0x10ac },=0A=
>+	{ CCI_REG16(0x6f12), 0x0014 },=0A=
>+	{ CCI_REG16(0x602a), 0x1110 },=0A=
>+	{ CCI_REG16(0x6f12), 0x001d },=0A=
>+	{ CCI_REG16(0x6f12), 0x004d },=0A=
>+	{ CCI_REG16(0x602a), 0x13e8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x080f },=0A=
>+	{ CCI_REG16(0x602a), 0x13f8 },=0A=
>+	{ CCI_REG16(0x6f12), 0x38c8 },=0A=
>+};=0A=
>+=0A=
>+static const struct s5k3t2_mode s5k3t2_supported_modes[] =3D {=0A=
>+	{=0A=
>+		.width =3D 5184,=0A=
>+		.height =3D 3880,=0A=
>+		.hts =3D 10880,=0A=
>+		.vts =3D 4096,=0A=
>+		.exposure =3D 1000,=0A=
>+		.link_freq_index =3D 0,=0A=
>+		.crop =3D {=0A=
>+			.left =3D 8,=0A=
>+			.top =3D 8,=0A=
>+			.width =3D 5184,=0A=
>+			.height =3D 3880,=0A=
>+		},=0A=
>+		.reg_list =3D {=0A=
>+			.regs =3D s5k3t2_5184x3880_mode,=0A=
>+			.num_regs =3D ARRAY_SIZE(s5k3t2_5184x3880_mode),=0A=
>+		},=0A=
>+	},=0A=
>+	{=0A=
>+		.width =3D 2592,=0A=
>+		.height =3D 1940,=0A=
>+		.hts =3D 5648,=0A=
>+		.vts =3D 1996,=0A=
>+		.exposure =3D 1000,=0A=
>+		.link_freq_index =3D 0,=0A=
>+		.crop =3D {=0A=
>+			.left =3D 8,=0A=
>+			.top =3D 8,=0A=
>+			.width =3D 5184,=0A=
>+			.height =3D 3880,=0A=
>+		},=0A=
>+		.reg_list =3D {=0A=
>+			.regs =3D s5k3t2_2592x1940_mode,=0A=
>+			.num_regs =3D ARRAY_SIZE(s5k3t2_2592x1940_mode),=0A=
>+		},=0A=
>+	},=0A=
>+	{=0A=
>+		.width =3D 1280,=0A=
>+		.height =3D 720,=0A=
>+		.hts =3D 5664,=0A=
>+		.vts =3D 992,=0A=
>+		.exposure =3D 500,=0A=
>+		.link_freq_index =3D 1,=0A=
>+		.crop =3D {=0A=
>+			.left =3D 40,=0A=
>+			.top =3D 508,=0A=
>+			.width =3D 5120,=0A=
>+			.height =3D 2880,=0A=
>+		},=0A=
>+		.reg_list =3D {=0A=
>+			.regs =3D s5k3t2_1280x720_mode,=0A=
>+			.num_regs =3D ARRAY_SIZE(s5k3t2_1280x720_mode),=0A=
>+		},=0A=
>+	},=0A=
>+};=0A=
>+=0A=
=0A=
In this driver each resolution is supported at only one link frequency=0A=
(448 MHz: 5184x3880 and 2592x1940, 300 MHz: 1280x720), and each mode's=0A=
register table already programs the PLL for it.=0A=
=0A=
If a resolution is not supported at more than one link frequency,=0A=
is there a reason to make the link frequency selectable from userspace?=0A=
=0A=
Changing the link frequency should not change the active resolution and=0A=
related controls. Otherwise, it can leave the rest of the pipeline=0A=
configured for the previous resolution, causing link validation to fail=0A=
on the next STREAMON.=0A=
=0A=
Best Regards,=0A=
Elgin=0A=
=0A=
>+static bool s5k3t2_filter_by_link_freq(const void *array, size_t index,=
=0A=
>+				       const void *context)=0A=
>+{=0A=
>+	const struct s5k3t2_mode *mode =3D array;=0A=
>+	const unsigned int *link_freq_index =3D context;=0A=
>+=0A=
>+	return mode->link_freq_index =3D=3D *link_freq_index;=0A=
>+}=0A=
>+=0A=
>+static const struct s5k3t2_mode *=0A=
>+s5k3t2_find_mode(unsigned int link_freq_index, u32 width, u32 height)=0A=
>+{=0A=
>+	return v4l2_find_nearest_size_conditional(s5k3t2_supported_modes,=0A=
>+						  ARRAY_SIZE(s5k3t2_supported_modes),=0A=
>+						  width, height, width, height,=0A=
>+						  s5k3t2_filter_by_link_freq,=0A=
>+						  &link_freq_index);=0A=
>+}=0A=
>+=0A=
>+static u32 s5k3t2_get_format_code(struct s5k3t2 *s5k3t2)=0A=
>+{=0A=
>+	unsigned int i;=0A=
>+=0A=
>+	i =3D (s5k3t2->vflip->val ? 2 : 0) | (s5k3t2->hflip->val ? 1 : 0);=0A=
>+=0A=
>+	return s5k3t2_mbus_formats[i];=0A=
>+}=0A=
>+=0A=
>+static void s5k3t2_format_from_mode(struct s5k3t2 *s5k3t2,=0A=
>+				    const struct s5k3t2_mode *mode,=0A=
>+				    struct v4l2_mbus_framefmt *fmt)=0A=
>+{=0A=
>+	fmt->code =3D s5k3t2_get_format_code(s5k3t2);=0A=
>+	fmt->width =3D mode->width;=0A=
>+	fmt->height =3D mode->height;=0A=
>+	fmt->field =3D V4L2_FIELD_NONE;=0A=
>+	fmt->colorspace =3D V4L2_COLORSPACE_RAW;=0A=
>+	fmt->ycbcr_enc =3D V4L2_YCBCR_ENC_DEFAULT;=0A=
>+	fmt->quantization =3D V4L2_QUANTIZATION_FULL_RANGE;=0A=
>+	fmt->xfer_func =3D V4L2_XFER_FUNC_NONE;=0A=
>+}=0A=
>+=0A=
>+static int s5k3t2_update_controls(struct s5k3t2 *s5k3t2,=0A=
>+				  const struct s5k3t2_mode *mode)=0A=
>+{=0A=
>+	s64 hblank, vblank, exposure_max;=0A=
>+	int ret;=0A=
>+=0A=
>+	hblank =3D mode->hts - mode->width;=0A=
>+	ret =3D __v4l2_ctrl_modify_range(s5k3t2->hblank, hblank, hblank, 1,=0A=
>+				       hblank);=0A=
>+	if (ret)=0A=
>+		return ret;=0A=
>+=0A=
>+	vblank =3D mode->vts - mode->height;=0A=
>+	ret =3D __v4l2_ctrl_modify_range(s5k3t2->vblank, vblank,=0A=
>+				       S5K3T2_VTS_MAX - mode->height, 1,=0A=
>+				       vblank);=0A=
>+	if (ret)=0A=
>+		return ret;=0A=
>+=0A=
>+	ret =3D __v4l2_ctrl_s_ctrl(s5k3t2->vblank, vblank);=0A=
>+	if (ret)=0A=
>+		return ret;=0A=
>+=0A=
>+	exposure_max =3D mode->vts - S5K3T2_EXPOSURE_MARGIN;=0A=
>+	ret =3D __v4l2_ctrl_modify_range(s5k3t2->exposure, S5K3T2_EXPOSURE_MIN,=
=0A=
>+				       exposure_max, S5K3T2_EXPOSURE_STEP,=0A=
>+				       mode->exposure);=0A=
>+	if (ret)=0A=
>+		return ret;=0A=
>+=0A=
>+	return __v4l2_ctrl_s_ctrl(s5k3t2->exposure, mode->exposure);=0A=
>+}=0A=
>+=0A=
>+static int s5k3t2_set_link_freq(struct s5k3t2 *s5k3t2,=0A=
>+				struct v4l2_subdev_state *state,=0A=
>+				unsigned int link_freq_index)=0A=
>+{=0A=
>+	struct v4l2_mbus_framefmt *fmt =3D v4l2_subdev_state_get_format(state, 0=
);=0A=
>+	const struct s5k3t2_mode *mode;=0A=
>+=0A=
>+	mode =3D s5k3t2_find_mode(link_freq_index, fmt->width, fmt->height);=0A=
>+	if (mode->width =3D=3D fmt->width && mode->height =3D=3D fmt->height)=0A=
>+		return 0;=0A=
>+=0A=
>+	s5k3t2_format_from_mode(s5k3t2, mode, fmt);=0A=
>+	*v4l2_subdev_state_get_crop(state, 0) =3D mode->crop;=0A=
>+=0A=
>+	return s5k3t2_update_controls(s5k3t2, mode);=0A=
>+}=0A=
>+=0A=
>+static int s5k3t2_set_ctrl(struct v4l2_ctrl *ctrl)=0A=
>+{=0A=
>+	struct s5k3t2 *s5k3t2 =3D container_of_const(ctrl->handler, struct s5k3t=
2,=0A=
>+						   ctrl_handler);=0A=
>+	const struct v4l2_mbus_framefmt *fmt;=0A=
>+	struct v4l2_subdev_state *state;=0A=
>+	s64 exposure_max, exposure_def;=0A=
>+	int ret;=0A=
>+=0A=
>+	state =3D v4l2_subdev_get_locked_active_state(&s5k3t2->sd);=0A=
>+	fmt =3D v4l2_subdev_state_get_format(state, 0);=0A=
>+=0A=
>+	if (ctrl->id =3D=3D V4L2_CID_LINK_FREQ)=0A=
>+		return s5k3t2_set_link_freq(s5k3t2, state, ctrl->val);=0A=
>+=0A=
>+	if (ctrl->id =3D=3D V4L2_CID_VBLANK) {=0A=
>+		exposure_max =3D fmt->height + ctrl->val - S5K3T2_EXPOSURE_MARGIN;=0A=
>+		exposure_def =3D min(s5k3t2->exposure->default_value,=0A=
>+				   exposure_max);=0A=
>+		ret =3D __v4l2_ctrl_modify_range(s5k3t2->exposure,=0A=
>+					       s5k3t2->exposure->minimum,=0A=
>+					       exposure_max,=0A=
>+					       s5k3t2->exposure->step,=0A=
>+					       exposure_def);=0A=
>+		if (ret)=0A=
>+			return ret;=0A=
>+	}=0A=
>+=0A=
>+	if (!pm_runtime_get_if_active(s5k3t2->dev))=0A=
>+		return 0;=0A=
>+=0A=
>+	switch (ctrl->id) {=0A=
>+	case V4L2_CID_ANALOGUE_GAIN:=0A=
>+		ret =3D cci_write(s5k3t2->regmap, S5K3T2_REG_AGAIN,=0A=
>+				ctrl->val << S5K3T2_AGAIN_SHIFT, NULL);=0A=
>+		break;=0A=
>+	case V4L2_CID_EXPOSURE:=0A=
>+		ret =3D cci_write(s5k3t2->regmap, S5K3T2_REG_EXPOSURE,=0A=
>+				ctrl->val, NULL);=0A=
>+		break;=0A=
>+	case V4L2_CID_HBLANK:=0A=
>+		ret =3D cci_write(s5k3t2->regmap, S5K3T2_REG_HTS,=0A=
>+				fmt->width + ctrl->val, NULL);=0A=
>+		break;=0A=
>+	case V4L2_CID_VBLANK:=0A=
>+		ret =3D cci_write(s5k3t2->regmap, S5K3T2_REG_VTS,=0A=
>+				fmt->height + ctrl->val, NULL);=0A=
>+		break;=0A=
>+	case V4L2_CID_TEST_PATTERN:=0A=
>+		ret =3D cci_write(s5k3t2->regmap, S5K3T2_REG_TEST_PATTERN,=0A=
>+				ctrl->val, NULL);=0A=
>+		break;=0A=
>+	case V4L2_CID_HFLIP:=0A=
>+		ret =3D cci_write(s5k3t2->regmap, S5K3T2_REG_ORIENTATION,=0A=
>+				(s5k3t2->hflip->val ? S5K3T2_HFLIP : 0) |=0A=
>+				(s5k3t2->vflip->val ? S5K3T2_VFLIP : 0), NULL);=0A=
>+		break;=0A=
>+	default:=0A=
>+		ret =3D -EINVAL;=0A=
>+		break;=0A=
>+	}=0A=
>+=0A=
>+	pm_runtime_put(s5k3t2->dev);=0A=
>+=0A=
>+	return ret;=0A=
>+}=0A=
>+=0A=
>+static const struct v4l2_ctrl_ops s5k3t2_ctrl_ops =3D {=0A=
>+	.s_ctrl =3D s5k3t2_set_ctrl,=0A=
>+};=0A=
>+=0A=
>+static int s5k3t2_init_controls(struct s5k3t2 *s5k3t2)=0A=
>+{=0A=
>+	struct v4l2_ctrl_handler *ctrl_hdlr =3D &s5k3t2->ctrl_handler;=0A=
>+	struct v4l2_fwnode_device_properties props;=0A=
>+	s64 hblank, vblank, exposure_max;=0A=
>+	const struct s5k3t2_mode *mode;=0A=
>+	int ret;=0A=
>+=0A=
>+	ret =3D v4l2_fwnode_device_parse(s5k3t2->dev, &props);=0A=
>+	if (ret)=0A=
>+		return ret;=0A=
>+=0A=
>+	mode =3D s5k3t2_find_mode(__ffs(s5k3t2->link_freq_bitmap),=0A=
>+				S5K3T2_DEFAULT_WIDTH, S5K3T2_DEFAULT_HEIGHT);=0A=
>+=0A=
>+	v4l2_ctrl_handler_init(ctrl_hdlr, 11);=0A=
>+=0A=
>+	s5k3t2->link_freq =3D=0A=
>+		v4l2_ctrl_new_int_menu(ctrl_hdlr, &s5k3t2_ctrl_ops,=0A=
>+				       V4L2_CID_LINK_FREQ,=0A=
>+				       __fls(s5k3t2->link_freq_bitmap),=0A=
>+				       __ffs(s5k3t2->link_freq_bitmap),=0A=
>+				       s5k3t2_link_freq_menu);=0A=
>+=0A=
>+	v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_PIXEL_RATE,=0A=
>+			  S5K3T2_PIXEL_RATE, S5K3T2_PIXEL_RATE, 1,=0A=
>+			  S5K3T2_PIXEL_RATE);=0A=
>+=0A=
>+	hblank =3D mode->hts - mode->width;=0A=
>+	s5k3t2->hblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &s5k3t2_ctrl_ops,=0A=
>+					   V4L2_CID_HBLANK, hblank,=0A=
>+					   hblank, 1, hblank);=0A=
>+=0A=
>+	vblank =3D mode->vts - mode->height;=0A=
>+	s5k3t2->vblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &s5k3t2_ctrl_ops,=0A=
>+					   V4L2_CID_VBLANK, vblank,=0A=
>+					   S5K3T2_VTS_MAX - mode->height, 1,=0A=
>+					   vblank);=0A=
>+=0A=
>+	v4l2_ctrl_new_std(ctrl_hdlr, &s5k3t2_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,=
=0A=
>+			  S5K3T2_AGAIN_MIN, S5K3T2_AGAIN_MAX,=0A=
>+			  S5K3T2_AGAIN_STEP, S5K3T2_AGAIN_DEFAULT);=0A=
>+=0A=
>+	exposure_max =3D mode->vts - S5K3T2_EXPOSURE_MARGIN;=0A=
>+	s5k3t2->exposure =3D v4l2_ctrl_new_std(ctrl_hdlr, &s5k3t2_ctrl_ops,=0A=
>+					     V4L2_CID_EXPOSURE,=0A=
>+					     S5K3T2_EXPOSURE_MIN,=0A=
>+					     exposure_max,=0A=
>+					     S5K3T2_EXPOSURE_STEP,=0A=
>+					     mode->exposure);=0A=
>+=0A=
>+	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &s5k3t2_ctrl_ops,=0A=
>+				     V4L2_CID_TEST_PATTERN,=0A=
>+				     ARRAY_SIZE(s5k3t2_test_pattern_menu) - 1,=0A=
>+				     0, 0, s5k3t2_test_pattern_menu);=0A=
>+=0A=
>+	s5k3t2->hflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &s5k3t2_ctrl_ops,=0A=
>+					  V4L2_CID_HFLIP, 0, 1, 1, 0);=0A=
>+	s5k3t2->vflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &s5k3t2_ctrl_ops,=0A=
>+					  V4L2_CID_VFLIP, 0, 1, 1, 0);=0A=
>+=0A=
>+	v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &s5k3t2_ctrl_ops, &props);=0A=
>+=0A=
>+	if (ctrl_hdlr->error)=0A=
>+		return v4l2_ctrl_handler_free(ctrl_hdlr);=0A=
>+=0A=
>+	ret =3D v4l2_ctrl_modify_range(s5k3t2->link_freq,=0A=
>+				     __ffs(s5k3t2->link_freq_bitmap),=0A=
>+				     __fls(s5k3t2->link_freq_bitmap),=0A=
>+				     ~s5k3t2->link_freq_bitmap,=0A=
>+				     __ffs(s5k3t2->link_freq_bitmap));=0A=
>+	if (ret) {=0A=
>+		v4l2_ctrl_handler_free(ctrl_hdlr);=0A=
>+		return ret;=0A=
>+	}=0A=
>+=0A=
>+	s5k3t2->link_freq->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;=0A=
>+	s5k3t2->hflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;=0A=
>+	s5k3t2->vflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;=0A=
>+	v4l2_ctrl_cluster(2, &s5k3t2->hflip);=0A=
>+=0A=
>+	s5k3t2->sd.ctrl_handler =3D ctrl_hdlr;=0A=
>+=0A=
>+	return 0;=0A=
>+}=0A=
>+=0A=
>+static int s5k3t2_enable_streams(struct v4l2_subdev *sd,=0A=
>+				 struct v4l2_subdev_state *state, u32 pad,=0A=
>+				 u64 streams_mask)=0A=
>+{=0A=
>+	struct s5k3t2 *s5k3t2 =3D to_s5k3t2(sd);=0A=
>+	const struct v4l2_mbus_framefmt *fmt;=0A=
>+	const struct s5k3t2_mode *mode;=0A=
>+	int ret;=0A=
>+=0A=
>+	ret =3D pm_runtime_resume_and_get(s5k3t2->dev);=0A=
>+	if (ret)=0A=
>+		return ret;=0A=
>+=0A=
>+	fmt =3D v4l2_subdev_state_get_format(state, 0);=0A=
>+	mode =3D s5k3t2_find_mode(s5k3t2->link_freq->val, fmt->width,=0A=
>+				fmt->height);=0A=
>+=0A=
>+	cci_write(s5k3t2->regmap, CCI_REG16(0x6028), 0x4000, &ret);=0A=
>+	cci_write(s5k3t2->regmap, CCI_REG16(0x0000), 0x0005, &ret);=0A=
>+	cci_write(s5k3t2->regmap, CCI_REG16(0x0000), S5K3T2_CHIP_ID, &ret);=0A=
>+	cci_write(s5k3t2->regmap, CCI_REG16(0x6010), 0x0001, &ret);=0A=
>+	if (ret)=0A=
>+		goto err_rpm_put;=0A=
>+=0A=
>+	usleep_range(5 * USEC_PER_MSEC, 6 * USEC_PER_MSEC);=0A=
>+=0A=
>+	cci_multi_reg_write(s5k3t2->regmap, s5k3t2_init_setting,=0A=
>+			    ARRAY_SIZE(s5k3t2_init_setting), &ret);=0A=
>+	cci_multi_reg_write(s5k3t2->regmap, mode->reg_list.regs,=0A=
>+			    mode->reg_list.num_regs, &ret);=0A=
>+	if (ret)=0A=
>+		goto err_rpm_put;=0A=
>+=0A=
>+	ret =3D __v4l2_ctrl_handler_setup(s5k3t2->sd.ctrl_handler);=0A=
>+=0A=
>+	cci_write(s5k3t2->regmap, S5K3T2_REG_MODE_SELECT,=0A=
>+		  S5K3T2_MODE_STREAMING, &ret);=0A=
>+	if (ret)=0A=
>+		goto err_rpm_put;=0A=
>+=0A=
>+	__v4l2_ctrl_grab(s5k3t2->vflip, true);=0A=
>+	__v4l2_ctrl_grab(s5k3t2->hflip, true);=0A=
>+	__v4l2_ctrl_grab(s5k3t2->link_freq, true);=0A=
>+=0A=
>+	return 0;=0A=
>+=0A=
>+err_rpm_put:=0A=
>+	dev_err(s5k3t2->dev, "failed to start streaming: %d\n", ret);=0A=
>+	pm_runtime_put_autosuspend(s5k3t2->dev);=0A=
>+=0A=
>+	return ret;=0A=
>+}=0A=
>+=0A=
>+static int s5k3t2_disable_streams(struct v4l2_subdev *sd,=0A=
>+				  struct v4l2_subdev_state *state, u32 pad,=0A=
>+				  u64 streams_mask)=0A=
>+{=0A=
>+	struct s5k3t2 *s5k3t2 =3D to_s5k3t2(sd);=0A=
>+	int ret;=0A=
>+=0A=
>+	ret =3D cci_write(s5k3t2->regmap, S5K3T2_REG_MODE_SELECT,=0A=
>+			S5K3T2_MODE_STANDBY, NULL);=0A=
>+	if (ret)=0A=
>+		dev_err(s5k3t2->dev, "failed to stop streaming: %d\n", ret);=0A=
>+=0A=
>+	__v4l2_ctrl_grab(s5k3t2->vflip, false);=0A=
>+	__v4l2_ctrl_grab(s5k3t2->hflip, false);=0A=
>+	__v4l2_ctrl_grab(s5k3t2->link_freq, false);=0A=
>+=0A=
>+	pm_runtime_put_autosuspend(s5k3t2->dev);=0A=
>+=0A=
>+	return ret;=0A=
>+}=0A=
>+=0A=
>+static int s5k3t2_set_pad_format(struct v4l2_subdev *sd,=0A=
>+				 struct v4l2_subdev_state *state,=0A=
>+				 struct v4l2_subdev_format *fmt)=0A=
>+{=0A=
>+	struct s5k3t2 *s5k3t2 =3D to_s5k3t2(sd);=0A=
>+	const struct s5k3t2_mode *mode;=0A=
>+=0A=
>+	mode =3D s5k3t2_find_mode(s5k3t2->link_freq->val, fmt->format.width,=0A=
>+				fmt->format.height);=0A=
>+=0A=
>+	s5k3t2_format_from_mode(s5k3t2, mode, &fmt->format);=0A=
>+	*v4l2_subdev_state_get_format(state, 0) =3D fmt->format;=0A=
>+	*v4l2_subdev_state_get_crop(state, 0) =3D mode->crop;=0A=
>+=0A=
>+	if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)=0A=
>+		return 0;=0A=
>+=0A=
>+	return s5k3t2_update_controls(s5k3t2, mode);=0A=
>+}=0A=
>+=0A=
>+static int s5k3t2_enum_mbus_code(struct v4l2_subdev *sd,=0A=
>+				 struct v4l2_subdev_state *sd_state,=0A=
>+				 struct v4l2_subdev_mbus_code_enum *code)=0A=
>+{=0A=
>+	struct s5k3t2 *s5k3t2 =3D to_s5k3t2(sd);=0A=
>+=0A=
>+	if (code->index > 0)=0A=
>+		return -EINVAL;=0A=
>+=0A=
>+	code->code =3D s5k3t2_get_format_code(s5k3t2);=0A=
>+=0A=
>+	return 0;=0A=
>+}=0A=
>+=0A=
>+static int s5k3t2_enum_frame_size(struct v4l2_subdev *sd,=0A=
>+				  struct v4l2_subdev_state *sd_state,=0A=
>+				  struct v4l2_subdev_frame_size_enum *fse)=0A=
>+{=0A=
>+	struct s5k3t2 *s5k3t2 =3D to_s5k3t2(sd);=0A=
>+	unsigned int i, index =3D fse->index;=0A=
>+=0A=
>+	if (fse->code !=3D s5k3t2_get_format_code(s5k3t2))=0A=
>+		return -EINVAL;=0A=
>+=0A=
>+	for (i =3D 0; i < ARRAY_SIZE(s5k3t2_supported_modes); i++) {=0A=
>+		const struct s5k3t2_mode *mode =3D &s5k3t2_supported_modes[i];=0A=
>+=0A=
>+		if (mode->link_freq_index !=3D s5k3t2->link_freq->val)=0A=
>+			continue;=0A=
>+=0A=
>+		if (index--)=0A=
>+			continue;=0A=
>+=0A=
>+		fse->min_width =3D mode->width;=0A=
>+		fse->max_width =3D fse->min_width;=0A=
>+		fse->min_height =3D mode->height;=0A=
>+		fse->max_height =3D fse->min_height;=0A=
>+=0A=
>+		return 0;=0A=
>+	}=0A=
>+=0A=
>+	return -EINVAL;=0A=
>+}=0A=
>+=0A=
>+static int s5k3t2_get_selection(struct v4l2_subdev *sd,=0A=
>+				struct v4l2_subdev_state *sd_state,=0A=
>+				struct v4l2_subdev_selection *sel)=0A=
>+{=0A=
>+	switch (sel->target) {=0A=
>+	case V4L2_SEL_TGT_CROP:=0A=
>+		sel->r =3D *v4l2_subdev_state_get_crop(sd_state, 0);=0A=
>+		return 0;=0A=
>+	case V4L2_SEL_TGT_NATIVE_SIZE:=0A=
>+		sel->r.left =3D 0;=0A=
>+		sel->r.top =3D 0;=0A=
>+		sel->r.width =3D S5K3T2_NATIVE_WIDTH;=0A=
>+		sel->r.height =3D S5K3T2_NATIVE_HEIGHT;=0A=
>+		return 0;=0A=
>+	case V4L2_SEL_TGT_CROP_DEFAULT:=0A=
>+	case V4L2_SEL_TGT_CROP_BOUNDS:=0A=
>+		sel->r.left =3D 8;=0A=
>+		sel->r.top =3D 8;=0A=
>+		sel->r.width =3D 5184;=0A=
>+		sel->r.height =3D 3880;=0A=
>+		return 0;=0A=
>+	default:=0A=
>+		return -EINVAL;=0A=
>+	}=0A=
>+}=0A=
>+=0A=
>+static int s5k3t2_init_state(struct v4l2_subdev *sd,=0A=
>+			     struct v4l2_subdev_state *state)=0A=
>+{=0A=
>+	struct v4l2_subdev_format fmt =3D {=0A=
>+		.which =3D V4L2_SUBDEV_FORMAT_TRY,=0A=
>+		.pad =3D 0,=0A=
>+		.format =3D {=0A=
>+			.width =3D S5K3T2_DEFAULT_WIDTH,=0A=
>+			.height =3D S5K3T2_DEFAULT_HEIGHT,=0A=
>+		},=0A=
>+	};=0A=
>+=0A=
>+	return s5k3t2_set_pad_format(sd, state, &fmt);=0A=
>+}=0A=
>+=0A=
>+static const struct v4l2_subdev_video_ops s5k3t2_video_ops =3D {=0A=
>+	.s_stream =3D v4l2_subdev_s_stream_helper,=0A=
>+};=0A=
>+=0A=
>+static const struct v4l2_subdev_pad_ops s5k3t2_pad_ops =3D {=0A=
>+	.set_fmt =3D s5k3t2_set_pad_format,=0A=
>+	.get_fmt =3D v4l2_subdev_get_fmt,=0A=
>+	.get_selection =3D s5k3t2_get_selection,=0A=
>+	.enum_mbus_code =3D s5k3t2_enum_mbus_code,=0A=
>+	.enum_frame_size =3D s5k3t2_enum_frame_size,=0A=
>+	.enable_streams =3D s5k3t2_enable_streams,=0A=
>+	.disable_streams =3D s5k3t2_disable_streams,=0A=
>+};=0A=
>+=0A=
>+static const struct v4l2_subdev_ops s5k3t2_subdev_ops =3D {=0A=
>+	.video =3D &s5k3t2_video_ops,=0A=
>+	.pad =3D &s5k3t2_pad_ops,=0A=
>+};=0A=
>+=0A=
>+static const struct v4l2_subdev_internal_ops s5k3t2_internal_ops =3D {=0A=
>+	.init_state =3D s5k3t2_init_state,=0A=
>+};=0A=
>+=0A=
>+static int s5k3t2_identify_sensor(struct s5k3t2 *s5k3t2)=0A=
>+{=0A=
>+	u64 val;=0A=
>+	int ret;=0A=
>+=0A=
>+	ret =3D cci_read(s5k3t2->regmap, S5K3T2_REG_CHIP_ID, &val, NULL);=0A=
>+	if (ret) {=0A=
>+		dev_err(s5k3t2->dev, "failed to read chip id: %d\n", ret);=0A=
>+		return ret;=0A=
>+	}=0A=
>+=0A=
>+	if (val !=3D S5K3T2_CHIP_ID) {=0A=
>+		dev_err(s5k3t2->dev, "chip id mismatch: %x!=3D%llx\n",=0A=
>+			S5K3T2_CHIP_ID, val);=0A=
>+		return -ENODEV;=0A=
>+	}=0A=
>+=0A=
>+	return 0;=0A=
>+}=0A=
>+=0A=
>+static int s5k3t2_check_hwcfg(struct s5k3t2 *s5k3t2)=0A=
>+{=0A=
>+	struct fwnode_handle *fwnode =3D dev_fwnode(s5k3t2->dev), *ep;=0A=
>+	struct v4l2_fwnode_endpoint bus_cfg =3D {=0A=
>+		.bus =3D {=0A=
>+			.mipi_csi2 =3D {=0A=
>+				.num_data_lanes =3D S5K3T2_DATA_LANES,=0A=
>+			},=0A=
>+		},=0A=
>+		.bus_type =3D V4L2_MBUS_CSI2_DPHY,=0A=
>+	};=0A=
>+	int ret;=0A=
>+=0A=
>+	ep =3D fwnode_graph_get_next_endpoint(fwnode, NULL);=0A=
>+	ret =3D v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);=0A=
>+	fwnode_handle_put(ep);=0A=
>+	if (ret)=0A=
>+		return ret;=0A=
>+=0A=
>+	if (bus_cfg.bus.mipi_csi2.num_data_lanes !=3D S5K3T2_DATA_LANES) {=0A=
>+		dev_err(s5k3t2->dev, "invalid number of data lanes: %u\n",=0A=
>+			bus_cfg.bus.mipi_csi2.num_data_lanes);=0A=
>+		ret =3D -EINVAL;=0A=
>+		goto endpoint_free;=0A=
>+	}=0A=
>+=0A=
>+	ret =3D v4l2_link_freq_to_bitmap(s5k3t2->dev, bus_cfg.link_frequencies,=
=0A=
>+				       bus_cfg.nr_of_link_frequencies,=0A=
>+				       s5k3t2_link_freq_menu,=0A=
>+				       ARRAY_SIZE(s5k3t2_link_freq_menu),=0A=
>+				       &s5k3t2->link_freq_bitmap);=0A=
>+=0A=
>+endpoint_free:=0A=
>+	v4l2_fwnode_endpoint_free(&bus_cfg);=0A=
>+=0A=
>+	return ret;=0A=
>+}=0A=
>+=0A=
>+static int s5k3t2_power_on(struct device *dev)=0A=
>+{=0A=
>+	struct v4l2_subdev *sd =3D dev_get_drvdata(dev);=0A=
>+	struct s5k3t2 *s5k3t2 =3D to_s5k3t2(sd);=0A=
>+	int ret;=0A=
>+=0A=
>+	ret =3D regulator_bulk_enable(ARRAY_SIZE(s5k3t2_supply_names),=0A=
>+				    s5k3t2->supplies);=0A=
>+	if (ret)=0A=
>+		return ret;=0A=
>+=0A=
>+	ret =3D clk_prepare_enable(s5k3t2->mclk);=0A=
>+	if (ret) {=0A=
>+		regulator_bulk_disable(ARRAY_SIZE(s5k3t2_supply_names),=0A=
>+				       s5k3t2->supplies);=0A=
>+		return ret;=0A=
>+	}=0A=
>+=0A=
>+	usleep_range(USEC_PER_MSEC, 2 * USEC_PER_MSEC);=0A=
>+	gpiod_set_value_cansleep(s5k3t2->reset_gpio, 0);=0A=
>+	usleep_range(10 * USEC_PER_MSEC, 15 * USEC_PER_MSEC);=0A=
>+=0A=
>+	return 0;=0A=
>+}=0A=
>+=0A=
>+static int s5k3t2_power_off(struct device *dev)=0A=
>+{=0A=
>+	struct v4l2_subdev *sd =3D dev_get_drvdata(dev);=0A=
>+	struct s5k3t2 *s5k3t2 =3D to_s5k3t2(sd);=0A=
>+=0A=
>+	gpiod_set_value_cansleep(s5k3t2->reset_gpio, 1);=0A=
>+=0A=
>+	clk_disable_unprepare(s5k3t2->mclk);=0A=
>+=0A=
>+	regulator_bulk_disable(ARRAY_SIZE(s5k3t2_supply_names), s5k3t2->supplies=
);=0A=
>+=0A=
>+	return 0;=0A=
>+}=0A=
>+=0A=
>+static int s5k3t2_probe(struct i2c_client *client)=0A=
>+{=0A=
>+	struct s5k3t2 *s5k3t2;=0A=
>+	unsigned long freq;=0A=
>+	int ret;=0A=
>+=0A=
>+	s5k3t2 =3D devm_kzalloc(&client->dev, sizeof(*s5k3t2), GFP_KERNEL);=0A=
>+	if (!s5k3t2)=0A=
>+		return -ENOMEM;=0A=
>+=0A=
>+	s5k3t2->dev =3D &client->dev;=0A=
>+	v4l2_i2c_subdev_init(&s5k3t2->sd, client, &s5k3t2_subdev_ops);=0A=
>+=0A=
>+	s5k3t2->regmap =3D devm_cci_regmap_init_i2c(client, 16);=0A=
>+	if (IS_ERR(s5k3t2->regmap))=0A=
>+		return dev_err_probe(s5k3t2->dev, PTR_ERR(s5k3t2->regmap),=0A=
>+				     "failed to init CCI\n");=0A=
>+=0A=
>+	s5k3t2->mclk =3D devm_v4l2_sensor_clk_get(s5k3t2->dev, NULL);=0A=
>+	if (IS_ERR(s5k3t2->mclk))=0A=
>+		return dev_err_probe(s5k3t2->dev, PTR_ERR(s5k3t2->mclk),=0A=
>+				     "failed to get MCLK clock\n");=0A=
>+=0A=
>+	freq =3D clk_get_rate(s5k3t2->mclk);=0A=
>+	if (freq !=3D S5K3T2_MCLK_FREQ)=0A=
>+		return dev_err_probe(s5k3t2->dev, -EINVAL,=0A=
>+				     "MCLK clock frequency %lu is not supported\n",=0A=
>+				     freq);=0A=
>+=0A=
>+	ret =3D s5k3t2_check_hwcfg(s5k3t2);=0A=
>+	if (ret)=0A=
>+		return dev_err_probe(s5k3t2->dev, ret,=0A=
>+				     "failed to check HW configuration\n");=0A=
>+=0A=
>+	s5k3t2->reset_gpio =3D devm_gpiod_get_optional(s5k3t2->dev, "reset",=0A=
>+						     GPIOD_OUT_HIGH);=0A=
>+	if (IS_ERR(s5k3t2->reset_gpio))=0A=
>+		return dev_err_probe(s5k3t2->dev, PTR_ERR(s5k3t2->reset_gpio),=0A=
>+				     "cannot get reset GPIO\n");=0A=
>+=0A=
>+	for (unsigned int i =3D 0; i < ARRAY_SIZE(s5k3t2_supply_names); i++)=0A=
>+		s5k3t2->supplies[i].supply =3D s5k3t2_supply_names[i];=0A=
>+=0A=
>+	ret =3D devm_regulator_bulk_get(s5k3t2->dev,=0A=
>+				      ARRAY_SIZE(s5k3t2_supply_names),=0A=
>+				      s5k3t2->supplies);=0A=
>+	if (ret)=0A=
>+		return dev_err_probe(s5k3t2->dev, ret,=0A=
>+				     "failed to get supply regulators\n");=0A=
>+=0A=
>+	ret =3D s5k3t2_power_on(s5k3t2->dev);=0A=
>+	if (ret)=0A=
>+		return ret;=0A=
>+=0A=
>+	ret =3D s5k3t2_identify_sensor(s5k3t2);=0A=
>+	if (ret) {=0A=
>+		dev_err_probe(s5k3t2->dev, ret, "failed to find sensor\n");=0A=
>+		goto err_power_off;=0A=
>+	}=0A=
>+=0A=
>+	ret =3D s5k3t2_init_controls(s5k3t2);=0A=
>+	if (ret) {=0A=
>+		dev_err_probe(s5k3t2->dev, ret, "failed to init controls\n");=0A=
>+		goto err_power_off;=0A=
>+	}=0A=
>+=0A=
>+	s5k3t2->sd.state_lock =3D s5k3t2->ctrl_handler.lock;=0A=
>+	s5k3t2->sd.internal_ops =3D &s5k3t2_internal_ops;=0A=
>+	s5k3t2->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;=0A=
>+	s5k3t2->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;=0A=
>+	s5k3t2->pad.flags =3D MEDIA_PAD_FL_SOURCE;=0A=
>+=0A=
>+	ret =3D media_entity_pads_init(&s5k3t2->sd.entity, 1, &s5k3t2->pad);=0A=
>+	if (ret) {=0A=
>+		dev_err_probe(s5k3t2->dev, ret,=0A=
>+			      "failed to init media entity pads\n");=0A=
>+		goto err_ctrl_handler_free;=0A=
>+	}=0A=
>+=0A=
>+	ret =3D v4l2_subdev_init_finalize(&s5k3t2->sd);=0A=
>+	if (ret < 0) {=0A=
>+		dev_err_probe(s5k3t2->dev, ret,=0A=
>+			      "failed to finalize subdev init\n");=0A=
>+		goto err_media_entity_cleanup;=0A=
>+	}=0A=
>+=0A=
>+	pm_runtime_set_active(s5k3t2->dev);=0A=
>+	pm_runtime_enable(s5k3t2->dev);=0A=
>+=0A=
>+	ret =3D v4l2_async_register_subdev_sensor(&s5k3t2->sd);=0A=
>+	if (ret < 0) {=0A=
>+		dev_err_probe(s5k3t2->dev, ret,=0A=
>+			      "failed to register V4L2 subdev\n");=0A=
>+		goto err_subdev_cleanup;=0A=
>+	}=0A=
>+=0A=
>+	pm_runtime_set_autosuspend_delay(s5k3t2->dev, 1000);=0A=
>+	pm_runtime_use_autosuspend(s5k3t2->dev);=0A=
>+	pm_runtime_idle(s5k3t2->dev);=0A=
>+=0A=
>+	return 0;=0A=
>+=0A=
>+err_subdev_cleanup:=0A=
>+	v4l2_subdev_cleanup(&s5k3t2->sd);=0A=
>+	pm_runtime_disable(s5k3t2->dev);=0A=
>+	pm_runtime_set_suspended(s5k3t2->dev);=0A=
>+=0A=
>+err_media_entity_cleanup:=0A=
>+	media_entity_cleanup(&s5k3t2->sd.entity);=0A=
>+=0A=
>+err_ctrl_handler_free:=0A=
>+	v4l2_ctrl_handler_free(s5k3t2->sd.ctrl_handler);=0A=
>+=0A=
>+err_power_off:=0A=
>+	s5k3t2_power_off(s5k3t2->dev);=0A=
>+=0A=
>+	return ret;=0A=
>+}=0A=
>+=0A=
>+static void s5k3t2_remove(struct i2c_client *client)=0A=
>+{=0A=
>+	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);=0A=
>+	struct s5k3t2 *s5k3t2 =3D to_s5k3t2(sd);=0A=
>+=0A=
>+	v4l2_async_unregister_subdev(sd);=0A=
>+	v4l2_subdev_cleanup(sd);=0A=
>+	media_entity_cleanup(&sd->entity);=0A=
>+	v4l2_ctrl_handler_free(sd->ctrl_handler);=0A=
>+	pm_runtime_dont_use_autosuspend(s5k3t2->dev);=0A=
>+	pm_runtime_disable(s5k3t2->dev);=0A=
>+=0A=
>+	if (!pm_runtime_status_suspended(s5k3t2->dev)) {=0A=
>+		s5k3t2_power_off(s5k3t2->dev);=0A=
>+		pm_runtime_set_suspended(s5k3t2->dev);=0A=
>+	}=0A=
>+}=0A=
>+=0A=
>+static const struct dev_pm_ops s5k3t2_pm_ops =3D {=0A=
>+	RUNTIME_PM_OPS(s5k3t2_power_off, s5k3t2_power_on, NULL)=0A=
>+};=0A=
>+=0A=
>+static const struct of_device_id s5k3t2_of_match[] =3D {=0A=
>+	{ .compatible =3D "samsung,s5k3t2" },=0A=
>+	{ }=0A=
>+};=0A=
>+MODULE_DEVICE_TABLE(of, s5k3t2_of_match);=0A=
>+=0A=
>+static struct i2c_driver s5k3t2_i2c_driver =3D {=0A=
>+	.driver =3D {=0A=
>+		.name =3D "s5k3t2",=0A=
>+		.pm =3D pm_ptr(&s5k3t2_pm_ops),=0A=
>+		.of_match_table =3D s5k3t2_of_match,=0A=
>+	},=0A=
>+	.probe =3D s5k3t2_probe,=0A=
>+	.remove =3D s5k3t2_remove,=0A=
>+};=0A=
>+=0A=
>+module_i2c_driver(s5k3t2_i2c_driver);=0A=
>+=0A=
>+MODULE_AUTHOR("Armandas Kvietkus <armandas.kvietkus@proton.me>");=0A=
>+MODULE_DESCRIPTION("Samsung S5K3T2 image sensor driver");=0A=
>+MODULE_LICENSE("GPL");=0A=
